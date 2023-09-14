import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/location_data_source.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource;

  LocationRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LocationEntity>> getCurrentPosition() async {
    try {
      final result = await dataSource.getCurrentPosition();
      return Right(result);
    } catch (e) {
      return const Left(FailureImpl());
    }
  }

  @override
  Future<Either<Failure, bool>> handleLocationPermission() async {
    try {
      final result = await dataSource.handleLocationPermission();
      return Right(result);
    } catch (e) {
      return const Left(FailureImpl());
    }
  }
}
