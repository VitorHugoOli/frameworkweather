import 'dart:convert';
import 'package:frameworkweather/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String url =
      'https://api.openweathermap.org/data/2.5/weather?q=Belohorizonte&appid=YOUR_API_KEY';

  Future<Weather> getWeather() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
