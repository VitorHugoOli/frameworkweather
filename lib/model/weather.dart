enum WeatherType {
  clearSky,
  fewClouds,
  scatteredClouds,
  brokenClouds,
  showerRain,
  rain,
  thunderstorm,
  snow,
  mist,
}

class Weather {
  final double maxTemp;
  final double minTemp;
  final double windSpeed;
  final int humidity;
  final String description;
  final double temperature;

  Weather({
    required this.maxTemp,
    required this.minTemp,
    required this.windSpeed,
    required this.humidity,
    required this.description,
    required this.temperature,
  });

  get weatherType => _getWeatherType(description);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      maxTemp: json['main']['temp_max'] ?? 0,
      minTemp: json['main']['temp_min'] ?? 0,
      windSpeed: json['wind']['speed'] ?? 0,
      humidity: json['main']['humidity'] ?? 0,
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'] ?? 0,
    );
  }

  WeatherType _getWeatherType(String description) {
    switch (description) {
      case 'clear sky':
        return WeatherType.clearSky;
      case 'few clouds':
        return WeatherType.fewClouds;
      case 'scattered clouds':
        return WeatherType.scatteredClouds;
      case 'broken clouds':
        return WeatherType.brokenClouds;
      case 'shower rain':
        return WeatherType.showerRain;
      case 'rain':
        return WeatherType.rain;
      case 'thunderstorm':
        return WeatherType.thunderstorm;
      case 'snow':
        return WeatherType.snow;
      case 'mist':
        return WeatherType.mist;
      default:
        return WeatherType.clearSky;
    }
  }
}
