import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class Minutely extends MinutelyEntity {
  const Minutely({
    required dt,
    required precipitation,
  }) : super(
          dt: dt,
          precipitation: precipitation,
        );

  factory Minutely.fromMap(Map<String, dynamic> json) => Minutely(
        dt: json["dt"],
        precipitation: json["precipitation"],
      );
}
