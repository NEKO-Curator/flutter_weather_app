import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/di/service_locator.dart';
import 'package:flutter_weather_app/features/weather/presentation/main_weather_screen/main_weather_bloc/main_weather_bloc.dart';

import '../widgets/weather_background_widget.dart';

class MainWeatherScreen extends StatefulWidget {
  const MainWeatherScreen({super.key});

  @override
  State<MainWeatherScreen> createState() => _MainWeatherScreenState();
}

class _MainWeatherScreenState extends State<MainWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<MainWeatherBloc>()..add(const UpdateWeatherEvent()),
      child: const WeatherBackgroundWidget(),
    );
  }
}
