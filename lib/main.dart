import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frameworkweather/envs/base.dart';
import 'package:frameworkweather/services/services.dart';
import 'package:frameworkweather/view/weather_page.dart';
import 'package:google_fonts/google_fonts.dart';

void app(Environments env) {
  WidgetsFlutterBinding.ensureInitialized();

  // Solve the error: "Handshake error in client"
  HttpOverrides.global = MyHttpOverrides();

  WeatherService.instance.init(env.OPENWEATHERKEY);
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Framework - Weather App',
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C80F1),
        ),
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: TextTheme(
          titleMedium: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
          bodySmall: GoogleFonts.roboto(
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.roboto(
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.roboto(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF4C80F1),
      ),
      home: WeatherPage(),
    );
  }
}
