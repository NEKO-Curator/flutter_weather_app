import 'package:flutter_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_app/features/weather/domain/utils/requests_models/weather_by_coordinates_request_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<OpenWeatherModel> getWeatherDataByCity({String? cityName}) {
    // TODO: implement getWeatherDataByCity
    throw UnimplementedError();
  }

  @override
  Future<OpenWeatherModel> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel?
          weatherByCoordinatesRequestModel}) async {
    try {
      final OpenWeatherModel? result =
          await remoteDataSource.getWeatherDataByCoordinates(
              weatherByCoordinatesRequestModel:
                  weatherByCoordinatesRequestModel);
      //TODO: убрать !
      return result!;
    } catch (e) {
      throw e;
    }
  }
}
