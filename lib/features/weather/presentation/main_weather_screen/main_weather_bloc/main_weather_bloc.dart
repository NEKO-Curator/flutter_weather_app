import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/di/service_locator.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/usecases/get_weather_data_by_coordinates.dart';
import 'package:flutter_weather_app/features/weather/utils/requests_models/weather_by_coordinates_request_model.dart';

part 'main_weather_state.dart';
part 'main_weather_event.dart';

class MainWeatherBloc extends Bloc<MainWeatherEvent, MainWeatherState> {
  MainWeatherBloc({required this.getWeatherDataByCoordinates})
      : super(const MainWeatherState()) {
    on<UpdateWeatherEvent>(_onUpdate);
  }
  final GetWeatherDataByCoordinates getWeatherDataByCoordinates;
  Future<void> _onUpdate(
      UpdateWeatherEvent event, Emitter<MainWeatherState> emit) async {
    emit(state.copyWith(
      status: MainWeatherStatus.loading,
    ));
    try {
      final coordinates =
          WeatherByCoordinatesRequestModel(lat: event.lat, lon: event.lon);
      final weather =
          await serviceLocator<GetWeatherDataByCoordinates>()(coordinates);
      emit(state.copyWith(results: weather, status: MainWeatherStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: MainWeatherStatus.failure));
    }
  }
}
