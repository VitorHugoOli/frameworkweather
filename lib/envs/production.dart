import 'package:frameworkweather/envs/base.dart';

// The API is exposed, but we could assign different keys for each environment.
// For production, we could leave the file containing the WeatherService key empty,
// and overwrite this file during the CI/CD pipeline process.
// By doing so, we avoid exposing the production API key, thereby enhancing security.
class ProductionEnv extends Environments {
  @override
  String get OPENWEATHERKEY => "a521bfed7c5adc3102080235fb393395";
}
