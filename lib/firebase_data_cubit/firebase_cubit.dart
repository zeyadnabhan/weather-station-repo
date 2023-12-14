import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_database/firebase_database.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseInitial());
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("WeatherStation");
  // read temprature value from firebase

  Future<DataSnapshot> readFromDatabase() async {
    DatabaseEvent event = await ref.once();
    //assign the value to the variable
    return event.snapshot;
  }
}
