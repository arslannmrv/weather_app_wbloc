import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_wbloc/data/repository.dart';
import 'package:weather_app_wbloc/locator.dart';
import 'package:weather_app_wbloc/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
  }
}

final WeatherRepository weatherRepository = locator<WeatherRepository>();

void _onFetchWeatherEvent(
    FetchWeatherEvent event, Emitter<WeatherState> emit) async {
  emit(WeatherLoadingState());
  try {
    final Weather inComingWeather =
        await weatherRepository.getWeather(event.cityName);
    emit(WeatherLoadedState(weather: inComingWeather));
  } catch (_) {
    emit(WeatherErrorState());
  }
}
