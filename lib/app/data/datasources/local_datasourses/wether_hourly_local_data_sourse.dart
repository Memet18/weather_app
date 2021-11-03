import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/data/models/weather_hourly_model.dart';
import 'package:weather_app/core/error/exception.dart';

abstract class WeatherHourlyLocalDataSource {
  Future<WeatherHourlyModel> getWeatherHourly();

  void saveWeatherHourly(WeatherHourlyModel weatherHourlyModel);
}

const weatherHourlyCache = 'weatherHourlyCache';

class WeatherHourlyLocalDataSourceImpl implements WeatherHourlyLocalDataSource {
  final SharedPreferences sharedPreferences;
  WeatherHourlyLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<WeatherHourlyModel> getWeatherHourly() {
    final cacheString = sharedPreferences.getString(weatherHourlyCache);
    if (cacheString!.isNotEmpty) {
      //print('Get WeatherDailyModel from Cache: $cacheString');
      return Future.value(
          WeatherHourlyModel.fromJson(json.decode(cacheString)));
    } else {
      throw CacheException();
    }
  }

  @override
  void saveWeatherHourly(WeatherHourlyModel weatherHourlyModel) {
    final cacheString = json.encode(weatherHourlyModel.toJson());
    sharedPreferences.setString(weatherHourlyCache, cacheString);
    //print('WeatherDailyModel to write Cache: $cacheString');
  }
}
