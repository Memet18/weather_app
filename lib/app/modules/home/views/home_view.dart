import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:weather_app/app/widgets/bottom_list_view.dart';
import 'package:weather_app/app/widgets/city_view.dart';
import 'package:weather_app/app/widgets/detail_view.dart';
import 'package:weather_app/app/widgets/temp_view.dart';
import 'package:weather_app/core/utils/strings.dart';
import 'package:weather_app/core/utils/style.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(WeatherAppStrings.weather.tr),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<int>(
              color: WeatherAppColors.darkGrey,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0,
                    child: Text(WeatherAppStrings.weatherWeekly.tr,
                        style: WeatherAppTextStyle.textAppBar)),
                PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      WeatherAppStrings.weatherTwoDays.tr,
                      style: WeatherAppTextStyle.textAppBar,
                    )),
              ],
              onSelected: (item) => controller.selectedItem(context, item),
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Obx(
                () => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CityView(
                        city: controller.weatherDailyEntity!.city.name,
                        country: controller.weatherDailyEntity!.city.country,
                        date: controller.isDailyMode.value
                            ? controller.weatherDailyEntity!
                                .list[controller.day.value].dt
                            : controller.weatherHourlyEntity!
                                .hourly[controller.day.value].dt,
                      ),
                      TempView(
                        icon: controller.isDailyMode.value
                            ? controller.weatherDailyEntity!
                                .list[controller.day.value].weather[0].icon
                            : controller.weatherHourlyEntity!
                                .hourly[controller.day.value].weather[0].icon,
                        temp: controller.isDailyMode.value
                            ? controller.weatherDailyEntity!
                                .list[controller.day.value].temp.day
                                .toStringAsFixed(0)
                            : controller.weatherHourlyEntity!
                                .hourly[controller.day.value].temp
                                .toStringAsFixed(0),
                        description: controller.isDailyMode.value
                            ? controller
                                .weatherDailyEntity!
                                .list[controller.day.value]
                                .weather[0]
                                .description
                            : controller
                                .weatherHourlyEntity!
                                .hourly[controller.day.value]
                                .weather[0]
                                .description,
                      ),
                      DetailView(
                        humidity: controller.isDailyMode.value
                            ? controller.weatherDailyEntity!
                                .list[controller.day.value].humidity
                            : controller.weatherHourlyEntity!
                                .hourly[controller.day.value].humidity,
                        pressure: controller.isDailyMode.value
                            ? controller.weatherDailyEntity!
                                .list[controller.day.value].pressure
                                .toDouble()
                            : controller.weatherHourlyEntity!
                                .hourly[controller.day.value].pressure
                                .toDouble(),
                        wind: controller.isDailyMode.value
                            ? controller.weatherDailyEntity!
                                .list[controller.day.value].speed
                            : controller.weatherHourlyEntity!
                                .hourly[controller.day.value].windSpeed,
                      ),
                      if (controller.isDailyMode.value)
                        BottomListViewDayli(
                            title: WeatherAppStrings.weatherWeekly.tr
                                .toUpperCase(),
                            onTapList: (i) {
                              controller.day.value = i;
                            },
                            weatherDailyEntities:
                                controller.weatherDailyEntity!),
                      if (controller.isDailyMode.value == false)
                        BottomListViewHourly(
                            title: WeatherAppStrings.weatherTwoDays.tr
                                .toUpperCase(),
                            onTapList: (i) {
                              controller.day.value = i;
                            },
                            weatherHourlyEntity:
                                controller.weatherHourlyEntity!),
                    ],
                  ),
                ),
              )));
  }
}
