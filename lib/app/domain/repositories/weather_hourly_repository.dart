import 'package:dartz/dartz.dart';
import 'package:weather_app/app/domain/entities/weather_hourly_entities.dart';
import 'package:weather_app/core/error/failure.dart';

abstract class WeatherHourlyRepository {
  Future<Either<Failure, WeatherHourlyEntity>> weatherHourly();
}
