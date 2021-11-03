import 'package:dartz/dartz.dart';
import 'package:weather_app/app/domain/entities/weather_hourly_entities.dart';
import 'package:weather_app/app/domain/repositories/weather_hourly_repository.dart';
import 'package:weather_app/core/error/failure.dart';

class WeatherHourlyUsecase {
  final WeatherHourlyRepository weatherHourlyRepository;

  WeatherHourlyUsecase({required this.weatherHourlyRepository});

  Future<Either<Failure, WeatherHourlyEntity>> call() async {
    return await weatherHourlyRepository.weatherHourly();
  }
}
