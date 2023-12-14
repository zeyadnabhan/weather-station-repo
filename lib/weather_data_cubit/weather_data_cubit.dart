import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_station/firebase_data_cubit/firebase_cubit.dart';
import 'package:weather_station/weather_data_model.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  final FirebaseCubit firebaseCubit;

  WeatherDataCubit(this.firebaseCubit) : super(WeatherDataInitial());

  Future<void> fetchWeatherData() async {
    try {
      emit(WeatherDataLoading());
      final weatherDataSnapshot = await firebaseCubit.readFromDatabase();
      final weatherData = WeatherDataModel.fromSnapshot(weatherDataSnapshot);

      emit(WeatherDataSucess(weatherData));
    } catch (e) {
    print('Error: $e');
    emit(WeatherDataFaluire(e.toString()));
    }
  }
}
