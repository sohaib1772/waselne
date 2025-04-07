import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

sealed class BookingStates {}

class BookingInitialState extends BookingStates {}

class BookingSuccessState extends BookingStates {

  String? message;
  BookingSuccessState({this.message});
}
class BookignChangeCheckStates extends BookingStates {
  bool? startPoint;
  bool? endPoint;
  BookignChangeCheckStates({this.startPoint,this.endPoint});
}
class BookingChagneSeatsCountState extends BookingStates{}
class BookingSaveTripSuccessState extends BookingStates {}
class BookignSaveTripLoadingState extends BookingStates{}
class BookingUnSaveTripSuccessState extends BookingStates {}
class BookingErrorState extends BookingStates {
  final String message;

  BookingErrorState(this.message);
}

class BookingLoadingState extends BookingStates {}