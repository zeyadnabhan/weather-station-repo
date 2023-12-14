part of 'weather_data_cubit.dart';

@immutable
sealed class WeatherDataState {}

final class WeatherDataInitial extends WeatherDataState {}
final class WeatherDataLoading extends WeatherDataState {}
final class WeatherDataSucess extends WeatherDataState {
  final WeatherDataModel weatherData;

  WeatherDataSucess(this.weatherData);
}
final class WeatherDataFaluire extends WeatherDataState {
  final String errorMessage;

  WeatherDataFaluire(this.errorMessage);
}



