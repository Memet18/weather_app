import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather_app/core/utils/forecast_util.dart';

class DetailView extends StatelessWidget {
  final double pressure;
  final int humidity;
  final double wind;
  const DetailView(
      {required this.pressure, required this.humidity, required this.wind});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
