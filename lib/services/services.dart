import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frameworkweather/main.dart';
import 'package:frameworkweather/model/weather.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class WeatherService {
  static final WeatherService _instance = WeatherService._internal();
  late final String _apiKey;
  final Uri baseUrl =
      Uri.parse("https://api.openweathermap.org/data/2.5/weather");
  bool _isInitialized = false;

  factory WeatherService() => _instance;

  WeatherService._internal();

  static WeatherService get instance => _instance;

  void init(String apiKey) {
    _apiKey = apiKey;
    _isInitialized = true;
  }

  get checkInit => !_isInitialized
      ? throw Exception("NasaApi is not initialized. Call init() method first.")
      : null;

  get error => ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Failed to load weather! Try again later.'),
        ),
      );

  Future<Weather?> getWeather(
      {String city = 'Belo Horizonte', String country = 'Brazil'}) async {
    checkInit;
    try {
      final Map<String, String> queryParameters = {
        'q': '$city,$country',
        'appid': _apiKey,
        'units': 'metric',
      };

      final Uri uri = baseUrl.replace(queryParameters: queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        error;
        return null;
      }
    } catch (e) {
      error;
      return null;
    }
  }
}
