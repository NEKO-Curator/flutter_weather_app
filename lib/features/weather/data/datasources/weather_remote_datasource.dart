import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/utils/requests_models/weather_by_coordinates_request_model.dart';

abstract class WeatherRemoteDataSource {
  Future<OpenWeatherModel?> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel? weatherByCoordinatesRequestModel});

  Future<OpenWeatherModel?> getWeatherDataByCity({String? cityName});
}
