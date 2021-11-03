import 'dart:convert';

import 'package:weather_app/app/data/models/weather_daily_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/error/exception.dart';

abstract class WeatherDailyRemoteDataSource {
  Future<WeatherDailyModel> getWeatherDaily(Uri url);
}

class WeatherDailyRemoteDataSourceImpl implements WeatherDailyRemoteDataSource {
  final http.Client client;

  WeatherDailyRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherDailyModel> getWeatherDaily(Uri url) async {
    print(url);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final responseUser = json.decode(response.body);
      return WeatherDailyModel.fromJson(responseUser);
    } else {
      throw ServerException();
    }
  }
}
