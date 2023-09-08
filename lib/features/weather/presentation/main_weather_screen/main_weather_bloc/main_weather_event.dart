part of 'main_weather_bloc.dart';

sealed class MainWeatherEvent extends Equatable {
  const MainWeatherEvent();
  @override
  List<Object?> get props => [];
}

final class UpdateWeatherEvent extends MainWeatherEvent {
  const UpdateWeatherEvent({required this.lon, required this.lat});
  final double lon;
  final double lat;
  @override
  List<Object?> get props => [lat, lon];
}
