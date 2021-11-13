import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_wbloc/bloc/bloc/weather_bloc.dart';

class MaxMinTempatureWidget extends StatelessWidget {
  const MaxMinTempatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Maksimum: " +
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .maxTemp
                      .floor()
                      .toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Minimum: " +
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .minTemp
                      .floor()
                      .toString(),
              style: const TextStyle(fontSize: 20),
            )
          ],
        );
      },
    );
  }
}
