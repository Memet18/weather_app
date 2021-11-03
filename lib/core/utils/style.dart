import 'package:flutter/material.dart';

class WeatherAppColors {
  static const Color darkGrey = Color(0xFF000033);
  static const Color white = Color(0xFFFFFFFF);
}

class WeatherAppTextStyle {
  static final TextStyle textAppBar = TextStyle(
      color: WeatherAppColors.white, fontWeight: FontWeight.w400, fontSize: 16);

  static final TextStyle textDarkGrey16 = TextStyle(
      color: WeatherAppColors.darkGrey,
      fontWeight: FontWeight.w400,
      fontSize: 16);

  static final TextStyle textDarkGreyBold28 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    color: WeatherAppColors.darkGrey,
  );

  static final TextStyle textDarkGrey54 = TextStyle(
    fontSize: 54.0,
    color: WeatherAppColors.darkGrey,
  );

  static final TextStyle textDarkGrey18 = TextStyle(
    fontSize: 18.0,
    color: WeatherAppColors.darkGrey,
  );
  static final TextStyle textWhite20 = TextStyle(
    fontSize: 20.0,
    color: WeatherAppColors.white,
  );

  static final TextStyle textWhite15 = TextStyle(
    fontSize: 15.0,
    color: WeatherAppColors.white,
  );

  static final TextStyle textDarkGreyBold20 = TextStyle(
      fontSize: 20.0,
      color: WeatherAppColors.darkGrey,
      fontWeight: FontWeight.bold);
}
