import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class Weather extends WeatherEntity {
  const Weather({
    required id,
    required main,
    required description,
    required icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}
