import 'package:flutter_weather_app/core/common/base_params_usecase.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_app/features/weather/utils/requests_models/weather_by_coordinates_request_model.dart';

class GetWeatherDataByCoordinates
    implements
        BaseParamsUseCase<OpenWeatherEntity?,
            WeatherByCoordinatesRequestModel> {
  GetWeatherDataByCoordinates(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<OpenWeatherModel?> call(
      WeatherByCoordinatesRequestModel? weatherByCoordinatesRequestModel) {
    return weatherRepository.getWeatherDataByCoordinates(
        weatherByCoordinatesRequestModel: weatherByCoordinatesRequestModel);
  }
}
