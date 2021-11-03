import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/platform/location.dart';
import 'app/data/datasources/local_datasourses/weather_daily_local_data_source.dart';
import 'app/data/datasources/local_datasourses/wether_hourly_local_data_sourse.dart';
import 'app/data/datasources/remote_datasources/weather_daily_remote_data_source.dart';
import 'app/data/datasources/remote_datasources/weather_hourly_remote_data_sourse.dart';
import 'app/data/repositories/weather_daily_repository.dart';
import 'app/data/repositories/weather_hourly_repository.dart';
import 'app/domain/repositories/weather_daily_repository.dart';
import 'app/domain/repositories/weather_hourly_repository.dart';
import 'app/domain/usecases/weather_daily_usecase.dart';

import 'app/domain/usecases/weather_hourly_usecase.dart';
import 'core/platform/network_info.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initDb();

  //Usecases
  Get.lazyPut<WeatherDailyUsecase>(
      () => WeatherDailyUsecase(
          weatherDailyRepository: Get.find<WeatherDailyRepository>()),
      fenix: true);

  Get.lazyPut<WeatherHourlyUsecase>(
      () => WeatherHourlyUsecase(
            weatherHourlyRepository: Get.find<WeatherHourlyRepository>(),
          ),
      fenix: true);

  // Repository
  Get.lazyPut<WeatherDailyRepository>(
      () => WeatherDailyRepositoryImpl(
            remoteDataSource: Get.find<WeatherDailyRemoteDataSource>(),
            localDataSource: Get.find<WeatherDailyLocalDataSource>(),
            networkInfo: Get.find<NetworkInfo>(),
            location: Get.find<Location>(),
          ),
      fenix: true);
  Get.lazyPut<WeatherHourlyRepository>(
      () => WeatherHourlyRepositoryImpl(
            remoteDataSource: Get.find<WeatherHourlyRemoteDataSource>(),
            localDataSource: Get.find<WeatherHourlyLocalDataSource>(),
            networkInfo: Get.find<NetworkInfo>(),
            location: Get.find<Location>(),
          ),
      fenix: true);

  //RemoteDataSources
  Get.lazyPut<WeatherDailyRemoteDataSource>(
      () => WeatherDailyRemoteDataSourceImpl(
            client: Get.find<http.Client>(),
          ),
      fenix: true);
  Get.lazyPut<WeatherHourlyRemoteDataSource>(
      () => WeatherHourlyRemoteDataSourceImpl(
            client: Get.find<http.Client>(),
          ),
      fenix: true);

  //LocaleDataSources
  Get.lazyPut<WeatherDailyLocalDataSource>(
    () => WeatherDailyLocalDataSourceImpl(
        sharedPreferences: Get.find<SharedPreferences>()),
    fenix: true,
  );
  Get.lazyPut<WeatherHourlyLocalDataSource>(
    () => WeatherHourlyLocalDataSourceImpl(
        sharedPreferences: Get.find<SharedPreferences>()),
    fenix: true,
  );
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferences>(() => sharedPreferences, fenix: true);
  Get.lazyPut<NetworkInfo>(
    () => NetworkInfoImpl(Get.find<Connectivity>()),
    fenix: true,
  );
  Get.lazyPut<Location>(() => Location(), fenix: true);
  Get.lazyPut<http.Client>(() => http.Client(), fenix: true);
  Get.lazyPut<Connectivity>(() => Connectivity(), fenix: true);
}
