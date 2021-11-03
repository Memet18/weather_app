import 'package:dartz/dartz.dart';
import 'package:weather_app/app/data/datasources/local_datasourses/wether_hourly_local_data_sourse.dart';
import 'package:weather_app/app/data/datasources/remote_datasources/weather_hourly_remote_data_sourse.dart';
import 'package:weather_app/app/data/mappers/weather_hourly_mapper.dart';
import 'package:weather_app/app/domain/entities/weather_hourly_entities.dart';
import 'package:weather_app/app/domain/repositories/weather_hourly_repository.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/platform/location.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/core/utils/constants.dart';

class WeatherHourlyRepositoryImpl implements WeatherHourlyRepository {
  final WeatherHourlyRemoteDataSource remoteDataSource;
  final WeatherHourlyLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final Location location;

  WeatherHourlyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.location,
  });

  @override
  Future<Either<Failure, WeatherHourlyEntity>> weatherHourly() async {
    Map<String, String?> parameters;
    try {
      await location.getCurrentLocation();
      if (location.latitude != null && location.longitude != null) {
        var params = {
          'appid': Constants.weatherAppId,
          'units': 'metric',
          'lat': location.latitude.toString(),
          'lon': location.longitude.toString(),
        };
        parameters = params;
      } else {
        var params = {
          'appid': Constants.weatherAppId,
          'units': 'metric',
          'lat': '50.4333',
          'lon': '30.5167',
        };
        parameters = params;
      }
    } catch (e) {
      var params = {
        'appid': Constants.weatherAppId,
        'units': 'metric',
        'lat': '50.4333',
        'lon': '30.5167',
      };
      parameters = params;
    }
    final Uri uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPathHourly, parameters);
    //print('request: ${uri.toString()}');

    if (await networkInfo.isConnected) {
      try {
        final remoteWeatherDaily = await remoteDataSource.getWeatherHourly(uri);
        localDataSource.saveWeatherHourly(remoteWeatherDaily);
        // print(localDataSource.getWeatherHourly());
        return Right(
            WetherHourlyMapper.fromWeatherHourlyModel(remoteWeatherDaily));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeatherDaily = await localDataSource.getWeatherHourly();
        return Right(
            WetherHourlyMapper.fromWeatherHourlyModel(localWeatherDaily));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
