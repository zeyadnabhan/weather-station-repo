import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_station/homeScreen.dart';
import 'package:weather_station/weather_data_cubit/weather_data_cubit.dart';

void main() {
  runApp(WeatherStation());
}

class WeatherStation extends StatelessWidget {
  const WeatherStation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherDataCubit>(
          create: (context) => WeatherDataCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.purple,
          ),
          home: HomeScreen()),
    );
  }
}