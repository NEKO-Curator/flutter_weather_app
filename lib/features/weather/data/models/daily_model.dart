import 'package:flutter_weather_app/features/weather/data/models/feelslike_model.dart';
import 'package:flutter_weather_app/features/weather/data/models/temp_model.dart';
import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class Daily extends DailyEntity {
  const Daily({
    required dt,
    required sunrise,
    required sunset,
    required moonrise,
    required moonset,
    required moonPhase,
    required summary,
    required temp,
    required feelsLike,
    required pressure,
    required humidity,
    required dewPoint,
    required windSpeed,
    required windDeg,
    required windGust,
    required weather,
    required clouds,
    required pop,
    required rain,
    required uvi,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          moonrise: moonrise,
          moonset: moonset,
          moonPhase: moonPhase,
          summary: summary,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          windSpeed: windSpeed,
          windDeg: windDeg,
          windGust: windGust,
          weather: weather,
          clouds: clouds,
          pop: pop,
          rain: rain,
          uvi: uvi,
        );

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        summary: json["summary"],
        temp: Temp.fromMap(json["temp"]),
        feelsLike: FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        rain: json["rain"].toDouble(),
        uvi: json["uvi"].toDouble(),
      );
}
