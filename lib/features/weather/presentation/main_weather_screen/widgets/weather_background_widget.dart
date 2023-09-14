import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/weather/presentation/main_weather_screen/main_weather_screen.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherBackgroundWidget extends StatelessWidget {
  const WeatherBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainWeatherBloc, MainWeatherState>(
      builder: (context, state) {
        return Stack(
          children: [
            PageView(
              children: [
                WeatherScene.sunset.getWeather(),
              ],
            ),
            const Center(
              child: Text("Hello"),
            ),
          ],
        );
      },
    );
  }
}
