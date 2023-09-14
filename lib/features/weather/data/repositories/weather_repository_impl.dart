import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/errors.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, OpenWeatherModel>> getWeatherDataByCity(
      {String? cityName}) {
    // TODO: implement getWeatherDataByCity
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OpenWeatherModel>> getWeatherDataByCoordinates(
      {LocationEntity? locationEntity}) async {
    final OpenWeatherModel? result = await remoteDataSource
        .getWeatherDataByCoordinates(locationEntity: locationEntity);
    if (result != null) {
      return Right(result);
    }
    return const Left(FailureImpl());
  }
}
