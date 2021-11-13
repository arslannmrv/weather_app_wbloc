import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_wbloc/bloc/bloc/weather_bloc.dart';

class WeatherStatePictureWidget extends StatelessWidget {
  const WeatherStatePictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) => Image.network(
        "https://www.metaweather.com/static/img/weather/png/" +
            (state as WeatherLoadedState)
                .weather
                .consolidatedWeather[0]
                .weatherStateAbbr +
            ".png",
        width: 300,
        height: 300,
      ),
    );
  }
}
