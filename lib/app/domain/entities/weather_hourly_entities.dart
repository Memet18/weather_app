import 'package:equatable/equatable.dart';
import 'package:weather_app/app/domain/entities/weather_entity.dart';

class WeatherHourlyEntity extends Equatable {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final List<HourlyEntity> hourly;
  WeatherHourlyEntity({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.hourly,
  });

  @override
  List<Object?> get props => [lat, lon, timezone, timezoneOffset, hourly];
}

class HourlyEntity {
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
  final List<WeatherEntity> weather;
  final double pop;
  HourlyEntity({
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
}
