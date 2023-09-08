import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/open_weather_api.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_model.dart';
import 'package:flutter_weather_app/features/weather/utils/requests_models/weather_by_coordinates_request_model.dart';
import 'package:http/http.dart' as http;

void main() {
  late OpenWeatherApiImpl openWeatherApiImpl;

  setUp(() {
    openWeatherApiImpl = OpenWeatherApiImpl(
      client: http.Client(),
      apiKey: '4ae5161441b4aaccbc506a0a64fe583a',
      apiBaseUrl: 'https://api.openweathermap.org/data/2.5',
    );
  });

  group('getWeatherDataByCoordinates', () {
    const tLat = 33.44;
    const tLon = -94.04;

    test(
      'should return OpenWeatherModel when the response code is 200',
      () async {
        // act
        final result = await openWeatherApiImpl.getWeatherDataByCoordinates(
            weatherByCoordinatesRequestModel:
                const WeatherByCoordinatesRequestModel(lat: tLat, lon: tLon));
        // assert
        expect(result, isNotNull);
        expect(result, isA<OpenWeatherModel>());
      },
    );
  });
}
