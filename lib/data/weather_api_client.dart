import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app_wbloc/model/weather.dart';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final cityURL = baseUrl + "/api/location/search/?query=" + cityName;
    final response = await httpClient.get(Uri.parse(cityURL));

    if (response.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final responseJSON = (jsonDecode(response.body)) as List;
    return responseJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int cityID) async {
    final weatherURL = baseUrl + "/api/location/$cityID";
    final weatherResponse = await httpClient.get(Uri.parse(weatherURL));
    if (weatherResponse.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }

    final weatherResponseJSON = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherResponseJSON);
  }
}
