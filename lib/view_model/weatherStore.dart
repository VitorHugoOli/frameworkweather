import 'package:frameworkweather/model/weather.dart';
import 'package:frameworkweather/services/services.dart';
import 'package:mobx/mobx.dart';

part 'weatherStore.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  final WeatherService _weatherService = WeatherService();

  @observable
  Weather? weather;

  @observable
  bool isLoading = false;

  @action
  Future getWeather() async {
    isLoading = true;
    weather = await _weatherService.getWeather();
    isLoading = false;
  }
}
