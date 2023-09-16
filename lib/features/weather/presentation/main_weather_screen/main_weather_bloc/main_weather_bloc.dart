import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';
import 'package:flutter_weather_app/features/weather/domain/usecases/get_current_location.dart';
import 'package:flutter_weather_app/features/weather/domain/usecases/get_weather_data_by_coordinates.dart';
import 'package:flutter_weather_app/features/weather/domain/usecases/handle_location_permission.dart';

part 'main_weather_state.dart';
part 'main_weather_event.dart';

class MainWeatherBloc extends Bloc<MainWeatherEvent, MainWeatherState> {
  MainWeatherBloc({
    required this.getWeatherDataByCoordinates,
    required this.getCurrentPositionUseCase,
    required this.handleLocationPermissionUseCase,
  }) : super(const MainWeatherState()) {
    on<UpdateWeatherEvent>(_onUpdate);
  }
  final GetWeatherDataByCoordinates getWeatherDataByCoordinates;
  final GetCurrentPositionUseCase getCurrentPositionUseCase;
  final HandleLocationPermissionUseCase handleLocationPermissionUseCase;

  Future<void> _onUpdate(
      UpdateWeatherEvent event, Emitter<MainWeatherState> emit) async {
    emit(state.copyWith(
      status: MainWeatherStatus.loading,
    ));
    try {
      final handle = await handleLocationPermissionUseCase();

      //чекаем разрешение на геолокацию

      handle.fold((l) {
        emit(state.copyWith(
            status: MainWeatherStatus.failure, statusMessage: l.toString()));
      }, (r) {});

      final location = await getCurrentPositionUseCase();
      late LocationEntity locationResult;
      //получаем координаты
      location.fold((l) {
        emit(state.copyWith(
            status: MainWeatherStatus.failure, statusMessage: l.toString()));
      }, (r) {
        locationResult = r;
      });
      //получаем погоду
      final weather = await getWeatherDataByCoordinates(locationResult);
      weather.fold((l) {
        emit(state.copyWith(
            status: MainWeatherStatus.failure, statusMessage: l.toString()));
      }, (r) {
        emit(state.copyWith(results: r, status: MainWeatherStatus.loaded));
      });
    } catch (e) {
      emit(state.copyWith(
          status: MainWeatherStatus.failure, statusMessage: e.toString()));
    }
  }
}
