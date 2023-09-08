import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/app/theme/color_schemes.g.dart';

class AppTheme {
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
  );
}
