part of 'main_weather_bloc.dart';

enum MainWeatherStatus { initial, loading, loaded, failure }

final class MainWeatherState extends Equatable {
  const MainWeatherState({
    this.status = MainWeatherStatus.initial,
    this.coordinatesRequestModel =
        const WeatherByCoordinatesRequestModel(lat: 59.9311, lon: 30.3609),
    this.results,
  });
  final MainWeatherStatus status;
  final WeatherByCoordinatesRequestModel coordinatesRequestModel;
  final OpenWeatherEntity? results;

  MainWeatherState copyWith({
    MainWeatherStatus? status,
    WeatherByCoordinatesRequestModel? coordinatesRequestModel,
    OpenWeatherEntity? results,
  }) {
    return MainWeatherState(
      status: status ?? this.status,
      coordinatesRequestModel:
          coordinatesRequestModel ?? this.coordinatesRequestModel,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [coordinatesRequestModel, results, status];
}
