import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:weather_station/weather_data_cubit/weather_data_cubit.dart';
import 'package:weather_station/weather_data_model.dart';
import 'package:weather_station/widget/data.dart';
import 'package:weather_station/widget/name.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool power = false;
  String temperature = '';
  String humidity = '';
  String airPressure = '';
  String altitude = '';
  String airQuality = '';

  @override
  void initState() {
    // TODO: implement initState
    const delay = Duration(seconds: 3);
    Timer.periodic(delay, (timer) {
      BlocProvider.of<WeatherDataCubit>(context).fetchWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherDataCubit, WeatherDataState>(
      listener: (context, state) {
        if (state is WeatherDataSucess) {
          setState(() {
            WeatherDataModel weatherData = state.weatherData;
            temperature = weatherData.temprature;
            humidity = weatherData.humidity;
            airPressure = weatherData.airPressure;
            altitude = weatherData.altitude;
            airQuality = weatherData.airQuality;
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 9.h),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          'Weather Station',
                          style: TextStyle(fontSize: 40.sp),
                        ),
                      ),
                      SizedBox(
                        height: 200.h,
                        child: Image.asset('assets/images/w.png'),
                      ),
                      Gap(30.w),
                      SensorData(
                        title: 'Temperature',
                        valueString: temperature,
                      ),
                      SensorData(
                        title: 'Humidity',
                        valueString: humidity,
                      ),
                      SensorData(
                        title: 'Air Pressure',
                        valueString: airPressure,
                      ),
                      SensorData(
                        title: 'Altitude',
                        valueString: altitude,
                      ),
                      SensorData(
                        title: 'Air Quality',
                        valueString: airQuality,
                      ),
                      Gap(30.h),
                      const SayMyName()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
