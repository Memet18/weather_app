import 'package:dartz/dartz.dart';
import 'package:weather_app/app/domain/entities/weather_daily_entities.dart';
import 'package:weather_app/app/domain/repositories/weather_daily_repository.dart';
import 'package:weather_app/core/error/failure.dart';

class WeatherDailyUsecase {
  final WeatherDailyRepository weatherDailyRepository;

  WeatherDailyUsecase({required this.weatherDailyRepository});

  Future<Either<Failure, WeatherDailyEntity>> call() async {
    return await weatherDailyRepository.weatherDaily();
  }
}
