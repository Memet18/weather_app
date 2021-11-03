import 'package:weather_app/app/data/models/weather_model.dart';
import 'package:weather_app/app/domain/entities/weather_entity.dart';

class WeatherMapper {
  static List<WeatherEntity> fromWeatherModel(List<WeatherModel> weatherModel) {
    List<WeatherEntity> list = [];
    for (int i = 0; i < weatherModel.length; i++) {
      list.add(WeatherEntity(
          id: weatherModel[i].id,
          description: weatherModel[i].description,
          icon: weatherModel[i].icon,
          main: weatherModel[i].main));
    }
    return list;
  }
}
