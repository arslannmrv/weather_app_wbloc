import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_wbloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_app_wbloc/widgets/choose_city.dart';
import 'package:weather_app_wbloc/widgets/last_update.dart';
import 'package:weather_app_wbloc/widgets/location.dart';
import 'package:weather_app_wbloc/widgets/max_min_tempature.dart';
import 'package:weather_app_wbloc/widgets/weather_state_picture.dart';

class WeatherApp extends StatelessWidget {
  String userSelectedCity = "Ankara";

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App With Bloc"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              userSelectedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseCityWidget()));
              _weatherBloc.add(FetchWeatherEvent(cityName: userSelectedCity));
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitialState) {
              return const Center(
                child: Text("Hello"),
              );
            } else if (state is WeatherErrorState) {
              return const Center(
                child: Text("You have a error"),
              );
            } else if (state is WeatherLoadedState) {
              return ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: LocationWidget()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: LastUpdateWidget()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: WeatherStatePictureWidget()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(child: MaxMinTempatureWidget()),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
