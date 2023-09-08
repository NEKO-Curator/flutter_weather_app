import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/utils/app_bloc_observer.dart';
import 'package:flutter_weather_app/features/app/app.dart';

import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MainApp());
}
