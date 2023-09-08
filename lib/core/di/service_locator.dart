import 'package:flutter_weather_app/core/network/http_network_client.dart';
import 'package:flutter_weather_app/core/shared/open_weather_api_constants.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/open_weather_api.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<OpenWeatherApiConstants>(
      () => OpenWeatherApiConstants());
  serviceLocator.registerFactory<http.Client>(
    () => HttpNetworkClient(http.Client()).client,
  );

  // News
  // serviceLocator.registerFactory<MainNewsBloc>(() => MainNewsBloc());
  serviceLocator
      .registerLazySingleton<OpenWeatherApiImpl>(() => OpenWeatherApiImpl(
            client: serviceLocator(),
            apiKey: serviceLocator<OpenWeatherApiConstants>().apiKey,
            apiBaseUrl: serviceLocator<OpenWeatherApiConstants>().apiBaseUrl,
          ));
  // serviceLocator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(
  //     newsApi: serviceLocator(), apiKey: serviceLocator<Constant>().apiKey));
  // serviceLocator.registerLazySingleton<GetRecentNewsUseCase>(
  //     () => GetRecentNewsUseCase(serviceLocator()));
}
