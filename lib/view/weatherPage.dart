import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../view_model/weatherStore.dart';

class WeatherPage extends StatelessWidget {
  final WeatherStore _weatherStore = WeatherStore();

  WeatherPage({super.key}) {
    _weatherStore.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clima em Belo Horizonte')),
      body: Observer(
        builder: (_) {
          if (_weatherStore.isLoading) {
            return const CircularProgressIndicator();
          }

          final weather = _weatherStore.weather;
          return Column(
            children: [
              Text('Descrição: ${weather?.description}'),
              Text('Temperatura: ${weather?.temperature}°C'),
              Text('Temperatura Máxima: ${weather?.maxTemp}°C'),
              Text('Temperatura Mínima: ${weather?.minTemp}°C'),
              Text('Umidade: ${weather?.humidity}%'),
              Text('Vel. Vento: ${weather?.windSpeed} m/s'),
            ],
          );
        },
      ),
    );
  }
}
