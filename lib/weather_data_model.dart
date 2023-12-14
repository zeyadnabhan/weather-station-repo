import 'package:firebase_database/firebase_database.dart';

class WeatherDataModel {
  final String airQuality;
  final String altitude;
  final String temprature;
  final String airPressure;
  final String humidity;

  WeatherDataModel({
    required this.airPressure,
    required this.airQuality,
    required this.altitude,
    required this.humidity,
    required this.temprature,
  });
factory WeatherDataModel.fromSnapshot(DataSnapshot snapshot) {
  Map data = snapshot.value as Map;
 
  WeatherDataModel model = WeatherDataModel(
    airQuality: data['airQuality'].toString(),
    altitude: data['altitude'].toString(),
    humidity: data['humidity'].toString(),
    temprature: data['Temperature'].toString(),
    airPressure: data['airPressure'].toString(),
    // Add other fields here
  );
  return model;
}
}
