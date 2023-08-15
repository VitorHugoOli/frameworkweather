import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frameworkweather/envs/production.dart';
import 'package:frameworkweather/extensions/datetime.dart';
import 'package:frameworkweather/services/services.dart';
import 'package:frameworkweather/view/weather_page.dart';
import 'package:frameworkweather/view_model/weather_store.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';



void main() {
  initializeDateFormatting('pt_BR', null);
  WeatherService.instance.init(ProductionEnv().OPENWEATHERKEY);

  testWidgets('WeatherHeader widget should display city and date', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: WeatherHeader(),
    ));

    // Verify if "Belo Horizonte" is displayed on the screen.
    expect(find.text('Belo Horizonte'), findsOneWidget);

    // Verify if today's date is displayed.
    final currentDate = DateTime
        .now()
        .formatted; // Assuming your formatted extension method returns a string representation of the date.
    expect(find.text(currentDate), findsOneWidget);
  });

  testWidgets('WeatherPage widget should display loading animation initially', (WidgetTester tester) async {
    final mockWeatherStore = WeatherStore();  // Ideally you would want to mock this but for simplicity, I'm using it as it is.

    // Wrap WeatherPage inside a Provider for dependency injection.
    await tester.pumpWidget(Provider<WeatherStore>(
      create: (_) => mockWeatherStore,
      child: MaterialApp(
        home: WeatherPage(),
      ),
    ));

    // Before any data is fetched, a loading animation should be displayed.
    expect(find.byWidget(Lottie.asset('assets/animation/load.json')), findsOneWidget);
  });

}