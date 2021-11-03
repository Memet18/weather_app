import 'package:flutter/material.dart';
import 'package:weather_app/app/domain/entities/weather_daily_entities.dart';
import 'package:weather_app/app/domain/entities/weather_hourly_entities.dart';

import 'package:weather_app/app/widgets/forecast_card_daily.dart';
import 'package:weather_app/app/widgets/forecast_card_hourly.dart';
import 'package:weather_app/core/utils/style.dart';

class BottomListViewDayli extends StatelessWidget {
  final String title;
  final WeatherDailyEntity weatherDailyEntities;
  final ValueChanged<int> onTapList;
  const BottomListViewDayli(
      {required this.weatherDailyEntities,
      required this.onTapList,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: WeatherAppTextStyle.textDarkGreyBold20,
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: weatherDailyEntities.list.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTapList(index);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 160,
                color: WeatherAppColors.darkGrey,
                child: forecastCardDayli(weatherDailyEntities, index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomListViewHourly extends StatelessWidget {
  final String title;
  final WeatherHourlyEntity weatherHourlyEntity;
  final ValueChanged<int> onTapList;
  const BottomListViewHourly(
      {required this.weatherHourlyEntity,
      required this.onTapList,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: weatherHourlyEntity.hourly.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTapList(index);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 160,
                color: WeatherAppColors.darkGrey,
                child: forecastCardHourly(weatherHourlyEntity, index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
