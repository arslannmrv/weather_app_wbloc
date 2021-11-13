import 'package:weather_app_wbloc/data/weather_api_client.dart';
import 'package:weather_app_wbloc/locator.dart';
import 'package:weather_app_wbloc/model/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async {
    final int cityID = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityID);
  }
}
