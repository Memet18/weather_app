import 'package:dartz/dartz.dart';
import 'package:weather_app/app/domain/entities/weather_daily_entities.dart';
import 'package:weather_app/core/error/failure.dart';

abstract class WeatherDailyRepository {
  Future<Either<Failure, WeatherDailyEntity>> weatherDaily();
}
