import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/utils/forecast_util.dart';
import 'package:weather_app/core/utils/strings.dart';
import 'package:weather_app/core/utils/style.dart';

import 'cache_image_widget.dart';

Widget forecastCardDayli(weatherDailyEntities, int index) {
  var forecastList = weatherDailyEntities.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = '${Util.getFormattedDate(date)}:00';
  dayOfWeek = fullDate.split(',')[0]; // Tue
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var tempMax = forecastList[index].temp.max.toStringAsFixed(0);
  var icon = forecastList[index].weather[0].icon;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: WeatherAppTextStyle.textWhite20,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '${WeatherAppStrings.min.tr} $tempMin °C',
                              style: WeatherAppTextStyle.textWhite15,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '${WeatherAppStrings.max.tr} $tempMax °C',
                              style: WeatherAppTextStyle.textWhite15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CacheImageWidget(width: 60, height: 60, imageUrl: icon),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
