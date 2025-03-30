import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<HomeTripModel> trips;
  final int? reasultCounts;

  HomeSuccessState(this.trips,this.reasultCounts);
}

class HomeErrorState extends HomeStates {
  final String message;
  HomeErrorState(this.message);
}

class HomeLoadingState extends HomeStates {}
class HomeFilterLoadingState extends HomeStates {}
class HomeShowCardLoadingState extends HomeStates {}

class HomeNoMoreDataToShowState extends HomeStates {}