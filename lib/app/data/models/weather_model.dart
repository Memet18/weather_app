import 'package:weather_app/core/utils/constants.dart';

class WeatherModel {
  int id;
  String main;
  String description;
  String icon;

  WeatherModel(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: Constants.weatherImagesUrl + json['icon'] + '.png',
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
