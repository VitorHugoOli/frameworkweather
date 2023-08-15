import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frameworkweather/extensions/datetime.dart';
import 'package:frameworkweather/model/weather.dart';
import 'package:lottie/lottie.dart';

import '../view_model/weather_store.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildCityAndDateInfo(context),
          _buildWeatherImage(),
        ],
      ),
    );
  }

  Column _buildCityAndDateInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Belo Horizonte",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          DateTime.now().formatted,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  ConstrainedBox _buildWeatherImage() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      // We could change the image based on the weatherType [https://lottiefiles.com/search?q=weather&category=animations&page=1]
      child: Image.asset('assets/sun.png'),
    );
  }
}

class WeatherPage extends StatelessWidget {
  final WeatherStore _weatherStore = WeatherStore();

  WeatherPage({Key? key}) : super(key: key) {
    _weatherStore.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Observer(
          builder: (_) {
            if (_weatherStore.isLoading) {
              return  Center(child: Lottie.asset('assets/animation/load.json'));
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const WeatherHeader(),
                Flexible(
                  child: Stack(
                    children: [
                      _buildCityImage(context),
                      _buildWeatherDetails(context, _weatherStore.weather),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Align _buildCityImage(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.6),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Image.asset('assets/city.png'),
      ),
    );
  }

  Align _buildWeatherDetails(BuildContext context, Weather? weather) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        decoration: _containerDecoration(),
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Climatempo", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: WeatherItemStats(
                    title: "Temp. máx.",
                    value: "${weather?.maxTemp}°C",
                    icon: 'assets/max.png',
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: WeatherItemStats(
                    title: "Temp. min.",
                    value: "${weather?.minTemp}°C",
                    icon: 'assets/min.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: WeatherItemStats(
                    title: "Vel. Vento",
                    value: "${weather?.windSpeed} m/s",
                    icon: 'assets/wind.png',
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: WeatherItemStats(
                    title: "Umidade",
                    value: "${weather?.humidity}%",
                    icon: 'assets/humidity.png',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return const BoxDecoration(
      color: Color(0xff6E6F83),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 0,
          spreadRadius: 0,
          offset: Offset(0, -4),
        ),
      ],
    );
  }
}

class WeatherItemStats extends StatelessWidget {
  final String title;
  final String value;
  final String icon;

  const WeatherItemStats({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIcon(),
        const SizedBox(width: 10),
        _buildTextInfo(context),
      ],
    );
  }

  Container _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(icon, fit: BoxFit.contain),
    );
  }

  Column _buildTextInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
