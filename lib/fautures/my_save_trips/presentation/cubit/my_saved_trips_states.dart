import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_save_trips/data/models/my_saved_trips_response_model.dart';

sealed class MySavedTripsStates{}

class MySavedTripsInitial extends MySavedTripsStates{}
class MySavedTripsLoading extends MySavedTripsStates{}
class MySavedTripsSuccess extends MySavedTripsStates{
  List<TripsDateGroupModel>? data;
  MySavedTripsSuccess(this.data);
}
class MySavedTripsDeleteSuccess extends MySavedTripsStates{
  
}

class MySavedTripsSaveLoadingState extends MySavedTripsStates{
  int? tripId;
  MySavedTripsSaveLoadingState(this.tripId);
}

class MySavedTripsSaveSuccessState extends MySavedTripsStates{
  
}
class MySavedTripsUnsaveSuccessState extends MySavedTripsStates{
  
}
class MySavedTripsError extends MySavedTripsStates{
  final String? message;
  MySavedTripsError(this.message);
}