import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_station/weather_data_cubit/weather_data_cubit.dart';
import 'package:weather_station/widget/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool power = false;

  bool auto = false;

  double position = 0;

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
            const Center(child: Text('Power Switch')),
            Switch(
              value: power,
              onChanged: (value) {
                setState(() {
                  power = value;
                });
              },
              activeTrackColor: Colors.lightBlue,
              activeColor: Colors.blue,
            ),
            Gap(50),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('Solar Panel Control'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: Switch(
                    value: auto,
                    onChanged: (val) {
                      power
                          ? setState(() {
                              auto = val;
                            })
                          : null;
                    },
                    activeTrackColor: Colors.lightBlue,
                    activeColor: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Slider(
                      value: position,
                      max: 100,
                      label: position.round().toString(),
                      onChanged: (double val) {
                        power && !auto
                            ? setState(() {
                                position = val;
                              })
                            : null;
                      }),
                ),
              ],
            ),
            Gap(100),
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
          ],
        ),
      ),
    );
  }
}
