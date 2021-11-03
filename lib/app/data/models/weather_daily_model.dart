import 'package:weather_app/app/data/models/weather_model.dart';

class WeatherDailyModel {
  final CityModel city;
  final String cod;
  final double message;
  final int cnt;
  final List<ListWeatherModel> list;

  const WeatherDailyModel(
      {required this.city,
      required this.cod,
      required this.message,
      required this.cnt,
      required this.list});

  factory WeatherDailyModel.fromJson(Map<String, dynamic> json) {
    return WeatherDailyModel(
        city: CityModel.fromJson(json['city']),
        cod: json['cod'],
        message: json['message'],
        cnt: json['cnt'],
        list: List.from(json['list'])
            .map((e) => ListWeatherModel.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city.toJson();
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    data['list'] = list.map((v) => v.toJson()).toList();

    return data;
  }
}

class CityModel {
  int id;
  String name;
  CoordModel coord;
  String country;
  int population;
  int timezone;

  CityModel(
      {required this.id,
      required this.name,
      required this.coord,
      required this.country,
      required this.population,
      required this.timezone});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json['id'],
        name: json['name'],
        coord: CoordModel.fromJson(json['coord']),
        country: json['country'],
        population: json['population'],
        timezone: json['timezone']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord.toJson();
    data['country'] = country;
    data['population'] = population.toInt();
    data['timezone'] = timezone.toInt();
    return data;
  }
}

class CoordModel {
  double lon;
  double lat;
  CoordModel({required this.lon, required this.lat});
  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(lon: json['lon'], lat: json['lat']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class ListWeatherModel {
  int dt;
  int sunrise;
  int sunset;
  TempModel temp;
  FeelsLikeModel feelsLike;
  int pressure;
  int humidity;
  List<WeatherModel> weather;
  double speed;
  int deg;
  double gust;
  int clouds;
  double pop;

  ListWeatherModel({
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

  factory ListWeatherModel.fromJson(Map<String, dynamic> json) {
    return ListWeatherModel(
      dt: json['dt'],
      sunrise: json['sunrise'].toInt(),
      sunset: json['sunset'].toInt(),
      temp: TempModel.fromJson(json['temp']),
      feelsLike: FeelsLikeModel.fromJson(json['feels_like']),
      pressure: json['pressure'].toInt(),
      humidity: json['humidity'].toInt(),
      weather: List.from(json['weather'])
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      speed: json['speed'].toDouble(),
      deg: json['deg'].toInt(),
      gust: json['gust'] == null ? 0.0 : json['gust'].toDouble(),
      clouds: json['clouds'].toInt(),
      pop: json['pop'] == null ? 0.0 : json['pop'].toDouble(),
      //rain: 0.0,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp.toJson();
    data['feels_like'] = feelsLike.toJson();
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['speed'] = speed;
    data['deg'] = deg;
    data['clouds'] = clouds;
    //data['rain'] = this.rain;
    return data;
  }
}

class TempModel {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  TempModel(
      {required this.day,
      required this.min,
      required this.max,
      required this.night,
      required this.eve,
      required this.morn});

  factory TempModel.fromJson(Map<String, dynamic> json) {
    return TempModel(
        day: json['day'].toDouble(),
        min: json['min'].toDouble(),
        max: json['max'].toDouble(),
        night: json['night'].toDouble(),
        eve: json['eve'].toDouble(),
        morn: json['morn'].toDouble());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class FeelsLikeModel {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLikeModel(
      {required this.day,
      required this.night,
      required this.eve,
      required this.morn});

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModel(
        day: json['day'].toDouble(),
        night: json['night'].toDouble(),
        eve: json['eve'].toDouble(),
        morn: json['morn'].toDouble());
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}
