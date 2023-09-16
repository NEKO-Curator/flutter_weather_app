import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, OpenWeatherEntity>> getWeatherDataByCoordinates(
      {LocationEntity? locationEntity});

  Future<Either<Failure, OpenWeatherEntity>> getWeatherDataByCity(
      {String? cityName});
}
