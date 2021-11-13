import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_wbloc/bloc/bloc/weather_bloc.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Text(
          (state as WeatherLoadedState).weather.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        );
      },
    );
  }
}
