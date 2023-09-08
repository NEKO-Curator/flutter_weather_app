import 'dart:convert';

import 'package:flutter_weather_app/features/weather/data/models/alert_model.dart';
import 'package:flutter_weather_app/features/weather/data/models/daily_model.dart';
import 'package:flutter_weather_app/features/weather/data/models/hourly_model.dart';
import 'package:flutter_weather_app/features/weather/data/models/minutely_model.dart';
import 'package:flutter_weather_app/features/weather/data/models/open_weather_current_model.dart';
import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class OpenWeatherModel extends OpenWeatherEntity {
  const OpenWeatherModel({
    required lat,
    required lon,
    required timezone,
    required timezoneOffset,
    required current,
    required minutely,
    required hourly,
    required daily,
    required alerts,
  }) : super(
          lat: lat,
          lon: lon,
          timezone: timezone,
          timezoneOffset: timezoneOffset,
          current: current,
          minutely: minutely,
          hourly: hourly,
          daily: daily,
          alerts: alerts,
        );

  factory OpenWeatherModel.fromJson(String str) =>
      OpenWeatherModel.fromMap(json.decode(str));

  factory OpenWeatherModel.fromMap(Map<String, dynamic> json) =>
      OpenWeatherModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromMap(json["current"]),
        minutely: List<Minutely>.from(
            json["minutely"].map((x) => Minutely.fromMap(x))),
        hourly: List<Hourly>.from(json["hourly"].map((x) => Hourly.fromMap(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
        alerts: List<Alert>.from(json["alerts"].map((x) => Alert.fromMap(x))),
      );
}
