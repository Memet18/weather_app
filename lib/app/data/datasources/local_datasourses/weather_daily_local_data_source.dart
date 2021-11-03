import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/data/models/weather_daily_model.dart';
import 'package:weather_app/core/error/exception.dart';

abstract class WeatherDailyLocalDataSource {
  Future<WeatherDailyModel> getWeatherDaily();

  void saveWeatherDaily(WeatherDailyModel weatherDailyModel);
}

const weatherDailyCache = 'weatherDailyCache';

class WeatherDailyLocalDataSourceImpl implements WeatherDailyLocalDataSource {
  final SharedPreferences sharedPreferences;
  WeatherDailyLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherDailyModel> getWeatherDaily() async {
    final cacheString = sharedPreferences.getString(weatherDailyCache);
    if (cacheString!.isNotEmpty) {
      print('Get WeatherDailyModel from Cache: $cacheString');
      return Future.value(WeatherDailyModel.fromJson(json.decode(cacheString)));
    } else {
      throw CacheException();
    }
  }

  @override
  void saveWeatherDaily(WeatherDailyModel weatherDailyModel) {
    final cacheString = json.encode(weatherDailyModel.toJson());
    sharedPreferences.setString(weatherDailyCache, cacheString);
    print('WeatherDailyModel to write Cache: $cacheString');
  }
}
