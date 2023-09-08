import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';

abstract class BaseParamsUseCase<Type, Request> {
  Future<OpenWeatherModel?> call(Request? params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
