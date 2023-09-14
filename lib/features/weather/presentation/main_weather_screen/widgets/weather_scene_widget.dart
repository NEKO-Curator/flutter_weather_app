import 'package:weather_animation/weather_animation.dart';

WeatherScene weatherScene(String param) {
  //Clouds, Clear, Snow, Drizzle, Thunderstorm, Rain
  switch (param) {
    case "Clouds":
      return WeatherScene.sunset;
    case "Clear":
      return WeatherScene.scorchingSun;
    case "Snow":
      return WeatherScene.frosty;
    case "Drizzle":
      return WeatherScene.rainyOvercast;
    default:
      return WeatherScene.weatherEvery;
  }
}
