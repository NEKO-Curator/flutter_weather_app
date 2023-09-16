part of 'main_weather_bloc.dart';

enum MainWeatherStatus { initial, loading, loaded, failure }

final class MainWeatherState extends Equatable {
  const MainWeatherState({
    this.status = MainWeatherStatus.initial,
    this.results,
    this.statusMessage = '',
  });
  final MainWeatherStatus status;
  final OpenWeatherEntity? results;
  final String statusMessage;

  MainWeatherState copyWith({
    MainWeatherStatus? status,
    OpenWeatherEntity? results,
    String? statusMessage,
  }) {
    return MainWeatherState(
      status: status ?? this.status,
      results: results ?? this.results,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [results, status];
}
