import 'package:weather_app/app/data/mappers/weather_mapper.dart';
import 'package:weather_app/app/data/models/weather_hourly_model.dart';
import 'package:weather_app/app/domain/entities/weather_hourly_entities.dart';

class WetherHourlyMapper {
  static WeatherHourlyEntity fromWeatherHourlyModel(
      WeatherHourlyModel weatherHourlyModel) {
    return WeatherHourlyEntity(
        hourly: _fromHourlyModel(weatherHourlyModel.hourly),
        lat: weatherHourlyModel.lat,
        lon: weatherHourlyModel.lon,
        timezone: weatherHourlyModel.timezone,
        timezoneOffset: weatherHourlyModel.timezoneOffset);
  }

  static List<HourlyEntity> _fromHourlyModel(List<HourlyModel> hourlyModel) {
    List<HourlyEntity> list = [];
    for (int i = 0; i < hourlyModel.length; i++) {
      list.add(HourlyEntity(
          clouds: hourlyModel[i].clouds,
          dewPoint: hourlyModel[i].dewPoint,
          dt: hourlyModel[i].dt,
          feelsLike: hourlyModel[i].feelsLike,
          humidity: hourlyModel[i].humidity,
          pop: hourlyModel[i].pop,
          pressure: hourlyModel[i].pressure,
          temp: hourlyModel[i].temp,
          uvi: hourlyModel[i].uvi,
          visibility: hourlyModel[i].visibility,
          weather: WeatherMapper.fromWeatherModel(hourlyModel[i].weather),
          windDeg: hourlyModel[i].windDeg,
          windGust: hourlyModel[i].windGust,
          windSpeed: hourlyModel[i].windSpeed));
    }
    return list;
  }
}
