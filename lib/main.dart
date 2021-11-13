import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_wbloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_app_wbloc/locator.dart';
import 'package:weather_app_wbloc/weather_app.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
          child: WeatherApp(),
        ));
  }
}
