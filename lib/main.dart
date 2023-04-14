import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/weatherCubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => weatherCubit(WeatherService()),
    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: BlocProvider.of<weatherCubit>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<weatherCubit>(context).weatherModel!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}