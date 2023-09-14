import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/app/theme/theme.dart';
import 'package:flutter_weather_app/features/weather/presentation/main_weather_screen/main_weather_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        home: const Scaffold(
          body: MainWeatherScreen(),
        )
        //routerConfig: AppRouter().generateRoute(),
        );
  }
}
