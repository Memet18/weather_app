import 'package:weather_app/app/data/datasources/local_datasourses/weather_daily_local_data_source.dart';
import 'package:weather_app/app/data/datasources/remote_datasources/weather_daily_remote_data_source.dart';
import 'package:weather_app/app/data/mappers/weather_daily_mapper.dart';
import 'package:weather_app/app/domain/entities/weather_daily_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/app/domain/repositories/weather_daily_repository.dart';

import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/platform/location.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/core/utils/constants.dart';

class WeatherDailyRepositoryImpl implements WeatherDailyRepository {
  final WeatherDailyRemoteDataSource remoteDataSource;
  final WeatherDailyLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final Location location;

  WeatherDailyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.location,
  });

  @override
  Future<Either<Failure, WeatherDailyEntity>> weatherDaily() async {
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
          'q': 'kyiv',
        };
        parameters = params;
      }
    } catch (e) {
      var params = {
        'appid': Constants.weatherAppId,
        'units': 'metric',
        'q': 'kyiv'
      };
      parameters = params;
    }
    final Uri uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPathDaily, parameters);
    print('request: WeatherDailyEntity ${uri.toString()}');

    if (await networkInfo.isConnected) {
      try {
        final remoteWeatherDaily = await remoteDataSource.getWeatherDaily(uri);
        localDataSource.saveWeatherDaily(remoteWeatherDaily);
        print(localDataSource.getWeatherDaily());
        return Right(
            WetherDailyMapper.fromWeatherDailyModel(remoteWeatherDaily));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeatherDaily = await localDataSource.getWeatherDaily();
        return Right(
            WetherDailyMapper.fromWeatherDailyModel(localWeatherDaily));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
