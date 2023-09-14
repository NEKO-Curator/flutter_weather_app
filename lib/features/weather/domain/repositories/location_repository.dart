import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationEntity>> getCurrentPosition();
  Future<Either<Failure, bool>> handleLocationPermission();
}
