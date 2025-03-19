import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

sealed class BookingStates {}

class BookingInitialState extends BookingStates {}

class BookingSuccessState extends BookingStates {

  String? message;
  BookingSuccessState({this.message});
}

class BookingErrorState extends BookingStates {
  final String message;

  BookingErrorState(this.message);
}

class BookingLoadingState extends BookingStates {}