import 'package:weather_app/app/data/mappers/weather_mapper.dart';
import 'package:weather_app/app/data/models/weather_daily_model.dart';

import 'package:weather_app/app/domain/entities/weather_daily_entities.dart';

class WetherDailyMapper {
  static WeatherDailyEntity fromWeatherDailyModel(
      WeatherDailyModel weatherDailyModel) {
    return WeatherDailyEntity(
        city: _fromCityModel(weatherDailyModel.city),
        cnt: weatherDailyModel.cnt,
        cod: weatherDailyModel.cod,
        list: _fromListWeatherModel(weatherDailyModel.list),
        message: weatherDailyModel.message);
  }

  static CityEntity _fromCityModel(CityModel cityModel) {
    return CityEntity(
        id: cityModel.id,
        coord: _fromCoordModel(cityModel.coord),
        country: cityModel.country,
        name: cityModel.name,
        population: cityModel.population,
        timezone: cityModel.timezone);
  }

  static CoordEntity _fromCoordModel(CoordModel coordModel) {
    return CoordEntity(lat: coordModel.lat, lon: coordModel.lon);
  }

  static List<ListWeatherEntity> _fromListWeatherModel(
      List<ListWeatherModel> listWeatherModel) {
    List<ListWeatherEntity> list = [];
    for (int i = 0; i < listWeatherModel.length; i++) {
      list.add(ListWeatherEntity(
          clouds: listWeatherModel[i].clouds,
          deg: listWeatherModel[i].deg,
          dt: listWeatherModel[i].dt,
          feelsLike: _fromFeelsLikeModel(listWeatherModel[i].feelsLike),
          gust: listWeatherModel[i].gust,
          humidity: listWeatherModel[i].humidity,
          pop: listWeatherModel[i].pop,
          pressure: listWeatherModel[i].pressure,
          speed: listWeatherModel[i].speed,
          sunrise: listWeatherModel[i].sunrise,
          sunset: listWeatherModel[i].sunset,
          temp: _fromTempModel(listWeatherModel[i].temp),
          weather:
              WeatherMapper.fromWeatherModel(listWeatherModel[i].weather)));
    }
    return list;
  }

  static TempEntity _fromTempModel(TempModel tempModel) {
    return TempEntity(
        day: tempModel.day,
        eve: tempModel.eve,
        max: tempModel.max,
        min: tempModel.min,
        morn: tempModel.morn,
        night: tempModel.night);
  }

  static FeelsLikeEntity _fromFeelsLikeModel(FeelsLikeModel feelsLikeModel) {
    return FeelsLikeEntity(
        day: feelsLikeModel.day,
        eve: feelsLikeModel.eve,
        morn: feelsLikeModel.morn,
        night: feelsLikeModel.night);
  }
}
