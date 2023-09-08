import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class Current extends OpenWeatherCurrentEntity {
  const Current({
    required dt,
    required sunrise,
    required sunset,
    required temp,
    required feelsLike,
    required pressure,
    required humidity,
    required dewPoint,
    required uvi,
    required clouds,
    required visibility,
    required windSpeed,
    required windDeg,
    required windGust,
    required weather,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          uvi: uvi,
          clouds: clouds,
          visibility: visibility,
          windSpeed: windSpeed,
          windDeg: windDeg,
          windGust: windGust,
          weather: weather,
        );

  factory Current.fromMap(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
      );
}
