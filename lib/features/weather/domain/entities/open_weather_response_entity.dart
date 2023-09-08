import 'package:equatable/equatable.dart';

class OpenWeatherEntity extends Equatable {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final OpenWeatherCurrentEntity? current;
  final List<MinutelyEntity?>? minutely;
  final List<HourlyEntity?>? hourly;
  final List<DailyEntity?>? daily;
  final List<AlertEntity?>? alerts;

  const OpenWeatherEntity({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
        timezone,
        timezoneOffset,
        current,
        minutely,
        hourly,
        daily,
        alerts,
      ];
}

class OpenWeatherCurrentEntity extends Equatable {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<WeatherEntity?>? weather;

  const OpenWeatherCurrentEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather,
      ];
}

class WeatherEntity extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}

class MinutelyEntity extends Equatable {
  final int? dt;
  final int? precipitation;

  const MinutelyEntity({
    required this.dt,
    required this.precipitation,
  });

  @override
  List<Object?> get props => [
        dt,
        precipitation,
      ];
}

class HourlyEntity extends Equatable {
  final int? dt;
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<WeatherEntity?>? weather;
  final double? pop;

  const HourlyEntity({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  @override
  List<Object?> get props => [
        dt,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather,
        pop,
      ];
}

class DailyEntity extends Equatable {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final String? summary;
  final TempEntity? temp;
  final FeelsLikeEntity? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<WeatherEntity?>? weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? uvi;

  const DailyEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        summary,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        windGust,
        weather,
        clouds,
        pop,
        rain,
        uvi,
      ];
}

class AlertEntity extends Equatable {
  final String? senderName;
  final String? event;
  final int? start;
  final int? end;
  final String? description;
  final List<String?>? tags;

  const AlertEntity({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
    required this.tags,
  });

  @override
  List<Object?> get props => [
        senderName,
        event,
        start,
        end,
        description,
        tags,
      ];
}

class TempEntity extends Equatable {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  const TempEntity({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  @override
  List<Object?> get props => [
        day,
        min,
        max,
        night,
        eve,
        morn,
      ];
}

class FeelsLikeEntity extends Equatable {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  const FeelsLikeEntity({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  @override
  List<Object?> get props => [
        day,
        night,
        eve,
        morn,
      ];
}
