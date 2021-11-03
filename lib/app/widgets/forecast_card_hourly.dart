import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/forecast_util.dart';
import 'package:weather_app/core/utils/style.dart';

import 'cache_image_widget.dart';

Widget forecastCardHourly(weatherHourlyEntities, int index) {
  var forecastList = weatherHourlyEntities.hourly;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = '${Util.getFormattedDateHour(date)}:00';
  dayOfWeek = fullDate.toString();
  var temp = forecastList[index].temp.toStringAsFixed(0);
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
                    child: Text(
                      ' $temp °C',
                      style: WeatherAppTextStyle.textWhite20,
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
