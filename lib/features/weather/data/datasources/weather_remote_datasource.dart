import 'package:flutter_weather_app/core/common/exceptions.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<OpenWeatherModel?> getWeatherDataByCoordinates(
      {LocationEntity? locationEntity});

  Future<OpenWeatherModel?> getWeatherDataByCity({String? cityName});
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final String apiKey;
  final String apiBaseUrl;
  final String units = 'metric';
  WeatherRemoteDataSourceImpl(
      {required this.client, required this.apiKey, required this.apiBaseUrl});

  @override
  Future<OpenWeatherModel?> getWeatherDataByCoordinates(
      {LocationEntity? locationEntity}) async {
    const exclude = '';
    final response = await client.get(
      Uri.parse(
          '$apiBaseUrl/forecast?lat=${locationEntity?.lat}&lon=${locationEntity?.lon}&exclude=$exclude&appid=$apiKey&lang=ru&units=$units'),
    );
    if (response.statusCode == 200) {
      return OpenWeatherModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw ServerException(jsonDecode(response.body)['message']);
    } else {
      throw ServerException('Failed to load weather data');
    }
  }

  @override
  Future<OpenWeatherModel?> getWeatherDataByCity({String? cityName}) {
    throw UnimplementedError();
  }
}
