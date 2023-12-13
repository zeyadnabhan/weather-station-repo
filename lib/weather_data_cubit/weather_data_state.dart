part of 'weather_data_cubit.dart';

@immutable
sealed class WeatherDataState {}

final class WeatherDataInitial extends WeatherDataState {}
final class WeatherDataLoading extends WeatherDataState {}
final class WeatherDataSucess extends WeatherDataState {}


