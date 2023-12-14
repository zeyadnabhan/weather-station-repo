import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_station/firebase_data_cubit/firebase_cubit.dart';
import 'package:weather_station/homeScreen.dart';
import 'package:weather_station/weather_data_cubit/weather_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase initialize app
  await Firebase.initializeApp();
  runApp(WeatherStation());
}

class WeatherStation extends StatelessWidget {
  const WeatherStation({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return MultiBlocProvider(
      providers: [
        // Add your identifier here
        // For example: child: Container(),
        BlocProvider<FirebaseCubit>(
          create: (context) => FirebaseCubit(),
        ),
        BlocProvider<WeatherDataCubit>(
          create: (context) => WeatherDataCubit(
            FirebaseCubit(),
          )..fetchWeatherData(),
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
