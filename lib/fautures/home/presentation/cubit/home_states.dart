import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<TripsDateGroupModel> trips;
  final int? reasultCounts;

  HomeSuccessState(this.trips,this.reasultCounts);
}

class HomeSaveTripSuccessState extends HomeStates {
  final String message;
  HomeSaveTripSuccessState(this.message);
}
class HomeUnSaveTripSuccessState extends HomeStates {
  final String message;
  HomeUnSaveTripSuccessState(this.message);
}
class HomeSaveTripLoadingState extends HomeStates {
  int tripId;
  HomeSaveTripLoadingState(this.tripId);
}

class HomeErrorState extends HomeStates {
  final String message;
  HomeErrorState(this.message);
}

class HomeLoadingState extends HomeStates {}
class HomeFilterLoadingState extends HomeStates {}
class HomeShowCardLoadingState extends HomeStates {}

class HomeNoMoreDataToShowState extends HomeStates {}