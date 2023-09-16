import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/weather/presentation/main_weather_screen/main_weather_screen.dart';
import 'package:intl/intl.dart';
import 'package:shake/shake.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherBackgroundWidget extends StatefulWidget {
  const WeatherBackgroundWidget({super.key});

  @override
  State<WeatherBackgroundWidget> createState() =>
      _WeatherBackgroundWidgetState();
}

class _WeatherBackgroundWidgetState extends State<WeatherBackgroundWidget> {
  late ShakeDetector detector;
  @override
  void initState() {
    ShakeDetector.autoStart(onPhoneShake: () {
      //add(const UpdateWeatherEvent());
      context.read<MainWeatherBloc>().add(const UpdateWeatherEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainWeatherBloc, MainWeatherState>(
      bloc: BlocProvider.of<MainWeatherBloc>(context),
      listener: (context, state) {
        if (state.status == MainWeatherStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.statusMessage),
            duration: const Duration(seconds: 5),
          ));
        }
      },
      child: BlocBuilder<MainWeatherBloc, MainWeatherState>(
        bloc: BlocProvider.of<MainWeatherBloc>(context),
        builder: (context, state) {
          return Stack(
            children: [
              PageView(
                children: [
                  weatherScene(state.results?.list[0].weather[0].main)
                      .getWeather(),
                ],
              ),
              if (state.status == MainWeatherStatus.loaded)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, left: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiaryContainer
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                '${state.results?.list[0].weather[0].description.toUpperCase()}',
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 60),
                            Text(
                              '${state.results?.list[0].main.temp}°',
                              style: const TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiaryContainer
                              .withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22),
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text(
                                '${state.results?.city.name}',
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    //horizontal
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                DateFormat('HH:mm').format(
                                                  state.results?.list[index + 1]
                                                          .dtTxt ??
                                                      DateTime.now(),
                                                ),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Container(
                                                height: 4,
                                              ),
                                              Image.network(
                                                  'http://openweathermap.org/img/w/${state.results?.list[index + 1].weather[0].icon}.png'), // Icon
                                              Container(
                                                height: 4,
                                              ),
                                              Text(
                                                '${state.results?.list[index + 1].main.temp.round()}°C',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  WeatherScene weatherScene(String? param) {
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
        return WeatherScene.sunset;
    }
  }
}
