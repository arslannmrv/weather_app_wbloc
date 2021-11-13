import 'package:get_it/get_it.dart';

import 'data/repository.dart';
import 'data/weather_api_client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}
