import 'package:equatable/equatable.dart';

class OpenWeatherEntity extends Equatable {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherDataEntity> list;
  final CityEntity city;

  const OpenWeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  @override
  List<Object> get props => [cod, message, cnt, list, city];
}

class WeatherDataEntity extends Equatable {
  final int dt;
  final MainEntity main;
  final List<WeatherEntity> weather;
  final CloudsEntity clouds;
  final WindEntity wind;
  final int visibility;
  final double pop;
  final RainEntity? rain;
  final SysEntity sys;
  final String dtTxt;

  const WeatherDataEntity({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  @override
  List<Object?> get props =>
      [dt, main, weather, clouds, wind, visibility, pop, rain, sys, dtTxt];
}

class MainEntity extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  const MainEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  @override
  List<Object> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf
      ];
}

class WeatherEntity extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object> get props => [id, main, description, icon];
}

class CloudsEntity extends Equatable {
  final int all;

  const CloudsEntity({required this.all});

  @override
  List<Object> get props => [all];
}

class WindEntity extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  const WindEntity({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object> get props => [speed, deg, gust];
}

class RainEntity extends Equatable {
  final double h3;

  const RainEntity({required this.h3});

  @override
  List<Object> get props => [h3];
}

class SysEntity extends Equatable {
  final String pod;

  const SysEntity({required this.pod});

  @override
  List<Object> get props => [pod];
}

class CityEntity extends Equatable {
  final int id;
  final String name;
  final CoordEntity coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  const CityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object> get props =>
      [id, name, coord, country, population, timezone, sunrise, sunset];
}

class CoordEntity extends Equatable {
  final double lat;
  final double lon;

  const CoordEntity({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object> get props => [lat, lon];
}
