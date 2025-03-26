import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';

sealed class MyBookingStates{}

class MyBookingInitial extends MyBookingStates{}
class MyBookingLoading extends MyBookingStates{}
class MyBookingSuccess extends MyBookingStates{
  List<MyBookingModel>? data;
  MyBookingSuccess(this.data);
}
class MyBookingDeleteSuccess extends MyBookingStates{
  
}
class MyBookingError extends MyBookingStates{
  final String? message;
  MyBookingError(this.message);
}