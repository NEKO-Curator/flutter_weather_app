import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class Temp extends TempEntity {
  const Temp({
    required day,
    required min,
    required max,
    required night,
    required eve,
    required morn,
  }) : super(
          day: day,
          min: min,
          max: max,
          night: night,
          eve: eve,
          morn: morn,
        );

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );
}
