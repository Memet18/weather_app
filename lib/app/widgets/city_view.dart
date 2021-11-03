import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/forecast_util.dart';
import 'package:weather_app/core/utils/style.dart';

class CityView extends StatelessWidget {
  final String city;
  final String country;
  final int date;

  const CityView(
      {required this.city, required this.country, required this.date});

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $country',
            style: WeatherAppTextStyle.textDarkGreyBold28,
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}:00',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
