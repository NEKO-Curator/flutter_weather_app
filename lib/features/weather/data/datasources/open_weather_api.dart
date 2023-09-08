import 'package:flutter_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/utils/requests_models/weather_by_coordinates_request_model.dart';
import 'package:http/http.dart' as http;

class OpenWeatherApiImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final String apiKey;
  final String apiBaseUrl;

  OpenWeatherApiImpl(
      {required this.client, required this.apiKey, required this.apiBaseUrl});

  Future<OpenWeatherModel?> fetchWeatherData(
      WeatherByCoordinatesRequestModel requestModel,
      [String exclude = '']) async {
    final response = await client.get(
      Uri.parse(
          '$apiBaseUrl/onecall?lat=${requestModel.lat}&lon=${requestModel.lon}&exclude=$exclude&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return OpenWeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Future<OpenWeatherModel?> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel?
          weatherByCoordinatesRequestModel}) async {
    const exclude = '';
    final response = await client.get(
      Uri.parse(
          '$apiBaseUrl/onecall?lat=${weatherByCoordinatesRequestModel?.lat}&lon=${weatherByCoordinatesRequestModel?.lon}&exclude=$exclude&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return OpenWeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Future<OpenWeatherModel?> getWeatherDataByCity({String? cityName}) {
    // TODO: implement getWeatherDataByCity
    throw UnimplementedError();
  }
}
