import 'package:flutter/material.dart';
import 'package:weather_station/homeScreen.dart';

void main() {
  runApp(WeatherStation());
}

class WeatherStation extends StatelessWidget {
  const WeatherStation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.purple,
        ),
        home: HomeScreen());
  }
}