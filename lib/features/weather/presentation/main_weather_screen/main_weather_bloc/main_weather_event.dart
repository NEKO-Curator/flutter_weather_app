part of 'main_weather_bloc.dart';

sealed class MainWeatherEvent extends Equatable {
  const MainWeatherEvent();
  @override
  List<Object?> get props => [];
}

final class UpdateWeatherEvent extends MainWeatherEvent {
  const UpdateWeatherEvent();
}
