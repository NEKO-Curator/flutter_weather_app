import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';

abstract class WeatherRepository {
  //TODO: заменить на  Entity
  //TODO: заменить на Future<Either<Failure, OpenWeatherModel>>
  Future<Either<Failure, OpenWeatherModel>> getWeatherDataByCoordinates(
      {LocationEntity? locationEntity});

  Future<Either<Failure, OpenWeatherModel>> getWeatherDataByCity(
      {String? cityName});
}
