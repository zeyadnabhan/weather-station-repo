import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_station/weather_data_cubit/weather_data_cubit.dart';
import 'package:weather_station/widget/data.dart';
import 'package:weather_station/widget/name.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool power = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherDataCubit, WeatherDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(100),
            const Center(
              child: Text(
                'Weather Station',
                style: TextStyle(fontSize: 40),
              ),
            ),
            const Gap(20),
            SizedBox(
              height: 200,
              child: Image.asset('assets/images/w.png'),
            ),
            const Gap(30),
            SensorData(
              title: 'Temperature',
              valueString: power ? '' : 'N/A',
            ),
            SensorData(
              title: 'Humidity',
              valueString: power ? '' : 'N/A',
            ),
            SensorData(
              title: 'Air Pressure',
              valueString: power ? '' : 'N/A',
            ),
            SensorData(
              title: 'Altitude',
              valueString: power ? '' : 'N/A',
            ),
            SensorData(
              title: 'Air Quality',
              valueString: power ? '' : 'N/A',
            ),
            const Gap(60),
            const SayMyName()
          ],
        ),
      ),
    );
  }
}

