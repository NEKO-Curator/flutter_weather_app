import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/weather/presentation/main_weather_screen/main_weather_screen.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherBackgroundWidget extends StatelessWidget {
  const WeatherBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainWeatherBloc, MainWeatherState>(
      bloc: BlocProvider.of<MainWeatherBloc>(context),
      builder: (context, state) {
        return Stack(
          children: [
            PageView(
              children: [
                WeatherScene.sunset.getWeather(),
              ],
            ),
            if (state.status == MainWeatherStatus.loaded)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('City: ${state.results?.city.name}'),
                    Text('Temperature: ${state.results?.list[0].main.temp}°C'),
                    Text('Weather: ${state.results?.list[0].weather[0].main}'),
                    Text(
                        'Description: ${state.results?.list[0].weather[0].description}'),
                    Text(
                        'Wind Speed: ${state.results?.list[0].wind.speed} m/s'),
                    Image.network(
                        'http://openweathermap.org/img/w/${state.results?.list[0].weather[0].icon}.png'), // Icon
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
