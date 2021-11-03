import 'package:weather_app/app/data/models/weather_model.dart';

class WeatherHourlyModel {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final List<HourlyModel> hourly;
  WeatherHourlyModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.hourly,
  });

  factory WeatherHourlyModel.fromJson(Map<String, dynamic> json) {
    return WeatherHourlyModel(
        lat: json['lat'],
        lon: json['lon'],
        timezone: json['timezone'],
        timezoneOffset: json['timezone_offset'],
        hourly: List.from(json['hourly'])
            .map((e) => HourlyModel.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['hourly'] = hourly.map((e) => e.toJson()).toList();
    return _data;
  }
}

class HourlyModel {
  final int dt;
  final double temp;
  final double? feelsLike;
  final double pressure;
  final int humidity;
  final double? dewPoint;
  final double? uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherModel> weather;
  final double pop;
  HourlyModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    return HourlyModel(
      dt: json['dt'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toInt(),
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      clouds: json['clouds'].toInt(),
      visibility: json['visibility'].toInt(),
      windSpeed:
          json['wind_speed'] == null ? 0.0 : json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'].toDouble(),
      weather: List.from(json['weather'])
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      pop: json['pop'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['pop'] = pop;
    return _data;
  }
}
