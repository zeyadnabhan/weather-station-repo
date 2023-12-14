part of 'firebase_cubit.dart';

@immutable
sealed class FirebaseState {}

final class FirebaseInitial extends FirebaseState {}

final class FirebaseSuccess extends FirebaseState {}
