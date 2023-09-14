import 'package:flutter_weather_app/core/network/http_network_client.dart';
import 'package:flutter_weather_app/core/shared/open_weather_api_constants.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/open_weather_api.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:flutter_weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_app/features/weather/domain/usecases/get_weather_data_by_coordinates.dart';
import 'package:flutter_weather_app/features/weather/presentation/main_weather_screen/main_weather_bloc/main_weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  // Weather
  serviceLocator.registerFactory<OpenWeatherApiConstants>(
      () => OpenWeatherApiConstants());
  serviceLocator.registerFactory<http.Client>(
    () => HttpNetworkClient(http.Client()).client,
  );
  serviceLocator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<GetWeatherDataByCoordinates>(
      () => GetWeatherDataByCoordinates(serviceLocator()));
  serviceLocator.registerFactory<MainWeatherBloc>(
      () => MainWeatherBloc(getWeatherDataByCoordinates: serviceLocator()));
  serviceLocator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(
            client: serviceLocator(),
            apiKey: serviceLocator<OpenWeatherApiConstants>().apiKey,
            apiBaseUrl: serviceLocator<OpenWeatherApiConstants>().apiBaseUrl,
          ));
}
