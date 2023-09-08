import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/app/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      //routerConfig: AppRouter().generateRoute(),
    );
  }
}
