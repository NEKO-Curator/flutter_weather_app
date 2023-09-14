import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/location_repository.dart';

class HandleLocationPermissionUseCase {
  final LocationRepository repository;

  HandleLocationPermissionUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.handleLocationPermission();
  }
}
