import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';

sealed class MyBookingStates{}

class MyBookingInitial extends MyBookingStates{}
class MyBookingLoading extends MyBookingStates{}
class MyBookingSuccess extends MyBookingStates{
  List<TripsDateGroupModel>? data;
  MyBookingSuccess(this.data);
}
class MyBookingDeleteSuccess extends MyBookingStates{
  
}
class MyBookingError extends MyBookingStates{
  final String? message;
  MyBookingError(this.message);
}

class MyBookingChangeStatus extends MyBookingStates{

}