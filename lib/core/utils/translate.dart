import 'package:get/get.dart';

class TranslateWeatherApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'serverFailureMessage': 'No Internet Conection',
          'cachedFailureMessage': 'Сache not found',
          'weatherWeekly': '7-Day Weather Forecast',
          'min': 'Min',
          'max': 'Max',
          'weather': 'Weather',
          'weatherTwoDays': 'Hourly weather'
        },
        'ru_RU': {
          'serverFailureMessage': 'Нет интернет соединения',
          'cachedFailureMessage': 'Кеш не обнаружен',
          'weatherWeekly': 'Прогноз погоды на 7 дней',
          'min': 'Мин',
          'max': 'Макс',
          'weather': 'Погода',
          'weatherTwoDays': 'Почасовой прогноз погоды'
        },
      };
}
