import 'package:flutter/material.dart';

import 'package:weather_app/core/utils/style.dart';

import 'cache_image_widget.dart';

class TempView extends StatelessWidget {
  final String icon;
  final String temp;
  final String description;
  const TempView(
      {required this.icon, required this.temp, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CacheImageWidget(width: 100, height: 100, imageUrl: icon),
          SizedBox(width: 20.0),
          Column(
            children: <Widget>[
              Text('$temp °C', style: WeatherAppTextStyle.textDarkGrey54),
              Text(description, style: WeatherAppTextStyle.textDarkGrey18),
            ],
          ),
        ],
      ),
    );
  }
}
