import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/app/data/models/weather_hourly_model.dart';
import 'package:weather_app/core/error/exception.dart';

abstract class WeatherHourlyRemoteDataSource {
  Future<WeatherHourlyModel> getWeatherHourly(Uri url);
}

class WeatherHourlyRemoteDataSourceImpl
    implements WeatherHourlyRemoteDataSource {
  final http.Client client;

  WeatherHourlyRemoteDataSourceImpl({required this.client});
  @override
  Future<WeatherHourlyModel> getWeatherHourly(Uri url) async {
    print(url);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final responseUser = json.decode(response.body);
      return WeatherHourlyModel.fromJson(responseUser);
    } else {
      throw ServerException();
    }
  }
}
