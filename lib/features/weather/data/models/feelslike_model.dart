import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class FeelsLike extends FeelsLikeEntity {
  const FeelsLike({
    required day,
    required night,
    required eve,
    required morn,
  }) : super(
          day: day,
          night: night,
          eve: eve,
          morn: morn,
        );

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );
}
