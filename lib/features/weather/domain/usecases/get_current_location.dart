import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/core/common/params_usecase.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/location_repository.dart';

class GetCurrentPositionUseCase extends UseCase<LocationEntity, void> {
  final LocationRepository repository;

  GetCurrentPositionUseCase(this.repository);

  @override
  Future<Either<Failure, LocationEntity>> call([params]) async {
    return await repository.getCurrentPosition();
  }
}
