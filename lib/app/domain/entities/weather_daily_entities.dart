import 'package:equatable/equatable.dart';
import 'package:weather_app/app/domain/entities/weather_entity.dart';

class WeatherDailyEntity extends Equatable {
  final CityEntity city;
  final String cod;
  final double message;
  final int cnt;
  final List<ListWeatherEntity> list;

  const WeatherDailyEntity(
      {required this.city,
      required this.cod,
      required this.message,
      required this.cnt,
      required this.list});

  @override
  List<Object?> get props => [city, cod, message, cnt, list];
}

class CityEntity {
  int id;
  String name;
  CoordEntity coord;
  String country;
  int population;
  int timezone;

  CityEntity(
      {required this.id,
      required this.name,
      required this.coord,
      required this.country,
      required this.population,
      required this.timezone});
}

class CoordEntity {
  double lon;
  double lat;
  CoordEntity({required this.lon, required this.lat});
}

class ListWeatherEntity {
  int dt;
  int sunrise;
  int sunset;
  TempEntity temp;
  FeelsLikeEntity feelsLike;
  int pressure;
  int humidity;
  List<WeatherEntity> weather;
  double speed;
  int deg;
  double gust;
  int clouds;
  double pop;

  ListWeatherEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
  });
}

class TempEntity {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  TempEntity(
      {required this.day,
      required this.min,
      required this.max,
      required this.night,
      required this.eve,
      required this.morn});
}

class FeelsLikeEntity {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLikeEntity(
      {required this.day,
      required this.night,
      required this.eve,
      required this.morn});
}
