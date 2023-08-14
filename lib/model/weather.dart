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

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      maxTemp: json['main']['temp_max'],
      minTemp: json['main']['temp_min'],
      windSpeed: json['wind']['speed'],
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
    );
  }
}
