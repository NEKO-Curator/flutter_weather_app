import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/core/common/params_usecase.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherDataByCoordinates
    implements UseCase<OpenWeatherEntity?, LocationEntity> {
  GetWeatherDataByCoordinates(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<Either<Failure, OpenWeatherModel?>> call(
      LocationEntity? locationEntity) {
    return weatherRepository.getWeatherDataByCoordinates(
        locationEntity: locationEntity);
  }
}
