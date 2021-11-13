import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_wbloc/bloc/bloc/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        var newDate = DateTime.parse((state as WeatherLoadedState).weather.time)
            .toLocal();
        return Text(
          "Last Update  " + TimeOfDay.fromDateTime(newDate).format(context),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
