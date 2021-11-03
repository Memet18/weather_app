import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/domain/entities/weather_daily_entities.dart';
import 'package:weather_app/app/domain/entities/weather_hourly_entities.dart';
import 'package:weather_app/app/domain/usecases/weather_daily_usecase.dart';
import 'package:weather_app/app/domain/usecases/weather_hourly_usecase.dart';

import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/utils/strings.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxInt day = 0.obs;
  final RxBool isDailyMode = true.obs;
  late WeatherDailyUsecase weatherDailyUsecase;
  late WeatherHourlyUsecase weatherHourlyUsecase;
  WeatherDailyEntity? weatherDailyEntity;
  WeatherHourlyEntity? weatherHourlyEntity;

  @override
  void onInit() {
    super.onInit();
    print('onInit');
    weatherDailyUsecase = Get.find<WeatherDailyUsecase>();
    weatherHourlyUsecase = Get.find<WeatherHourlyUsecase>();
    weatherDayliHourly();
  }

  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        isDailyMode.value = true;
        break;
      case 1:
        isDailyMode.value = false;
        break;
    }
  }

  void weatherDayliHourly() async {
    final weatherDailyRemoteOrCache = await weatherDailyUsecase();
    weatherDailyRemoteOrCache.fold(
        (error) => Get.snackbar('Error', _mapFailureToMessage(error)),
        (r) => successWeatherDailydata(r));

    final weatherHourlyRemoteOrCache = await weatherHourlyUsecase();
    weatherHourlyRemoteOrCache.fold(
        (error) => Get.snackbar('Error', _mapFailureToMessage(error)),
        (r) => successWeatherHourlydata(r));
  }

  successWeatherHourlydata(WeatherHourlyEntity w) {
    weatherHourlyEntity = w;
    if (weatherDailyEntity != null && weatherHourlyEntity != null) {
      isLoading.value = false;
    }
  }

  successWeatherDailydata(WeatherDailyEntity w) {
    weatherDailyEntity = w;
    if (weatherDailyEntity != null && weatherHourlyEntity != null) {
      isLoading.value = false;
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return WeatherAppStrings.serverFailureMessage.tr;
      case CacheFailure:
        return WeatherAppStrings.cachedFailureMessage.tr;
      default:
        return 'Unexpected Error';
    }
  }
}
