import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Gap(100),
        Center(
          child: Text(
            'Weather Station',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Gap(20),
        Center(child: Text('Power Switch')),
        Switch(
          value: power,
          onChanged: (val) {
            setState(
              () {
                power = val;
              },
            );
          },
          activeTrackColor: Colors.lightBlue,
          activeColor: Colors.blue,
        ),
        Gap(50),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text('Solar Panel Controll'),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Switch(
                value: auto,
                onChanged: (val) {
                  setState(
                    () {
                      auto = val;
                    },
                  );
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
                    StepState() {
                      position = val;
                    }
                  }),
            ),
          ],
        ),
        Gap(100),
        SensorData(
          title: 'Temperature',
          valueString: '',
        ),
        SensorData(
          title: 'Humidity',
          valueString: '',
        ),
        SensorData(
          title: 'Air Pressure',
          valueString: '',
        ),
        SensorData(
          title: 'Altitude',
          valueString: '',
        ),
      ],
    ));
  }
}
