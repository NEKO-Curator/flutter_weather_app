import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

//TODO: переделать модель
class OpenWeatherModel extends OpenWeatherEntity {
  const OpenWeatherModel({
    required message,
    required cnt,
    required list,
    required city,
    required cod,
  }) : super(
          message: message,
          cnt: cnt,
          list: list,
          city: city,
          cod: cod,
        );
  factory OpenWeatherModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherModel(
      message: json['message'] as int,
      cnt: json['cnt'] as int,
      list: List<OpenWeatherList>.from(
          (json['list'] as List<dynamic>).map((dynamic x) {
        return OpenWeatherList.fromJson(x as Map<String, dynamic>);
      })),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      cod: json['cod'] as String,
    );
  }
}

class OpenWeatherList extends WeatherDataEntity {
  const OpenWeatherList({
    required dt,
    required main,
    required weather,
    required clouds,
    required wind,
    required visibility,
    required pop,
    required sys,
    required dtTxt,
  }) : super(
          dt: dt,
          main: main,
          weather: weather,
          clouds: clouds,
          wind: wind,
          visibility: visibility,
          pop: pop,
          sys: sys,
          dtTxt: dtTxt,
        );
  factory OpenWeatherList.fromJson(Map<String, dynamic> json) {
    return OpenWeatherList(
      dt: json['dt'] as int,
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: List<Weather>.from(
          (json['weather'] as List<dynamic>).map((dynamic x) {
        return Weather.fromJson(x as Map<String, dynamic>);
      })),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      pop: json['pop'].toDouble(),
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String,
    );
  }
}

class City extends CityEntity {
  const City({
    required id,
    required name,
    required coord,
    required country,
    required population,
    required timezone,
    required sunrise,
    required sunset,
  }) : super(
          id: id,
          name: name,
          coord: coord,
          country: country,
          population: population,
          timezone: timezone,
          sunrise: sunrise,
          sunset: sunset,
        );
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      name: json['name'] as String,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String,
      population: json['population'] as int,
      timezone: json['timezone'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );
  }
}

class MainModel extends MainEntity {
  const MainModel({
    required temp,
    required feelsLike,
    required tempMin,
    required tempMax,
    required pressure,
    required seaLevel,
    required grndLevel,
    required humidity,
    required tempKf,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          seaLevel: seaLevel,
          grndLevel: grndLevel,
          humidity: humidity,
          tempKf: tempKf,
        );
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'] as int,
      seaLevel: json['sea_level'] as int,
      grndLevel: json['grnd_level'] as int,
      humidity: json['humidity'] as int,
      tempKf: json['temp_kf'].toDouble(),
    );
  }
}

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
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }
}

class Clouds extends CloudsEntity {
  const Clouds({
    required all,
  }) : super(
          all: all,
        );
  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as int,
    );
  }
}

class Wind extends WindEntity {
  const Wind({
    required speed,
    required deg,
    required gust,
  }) : super(
          speed: speed,
          deg: deg,
          gust: gust,
        );
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'].toInt(),
      gust: json['gust'].toDouble(),
    );
  }
}

class Sys extends SysEntity {
  const Sys({
    required pod,
  }) : super(
          pod: pod,
        );
  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'] as String,
    );
  }
}

class Coord extends CoordEntity {
  const Coord({
    required lon,
    required lat,
  }) : super(
          lon: lon,
          lat: lat,
        );
  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'] as double,
      lat: json['lat'] as double,
    );
  }
}
