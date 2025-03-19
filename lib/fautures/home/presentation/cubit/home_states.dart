import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<HomeTripModel> trips;

  HomeSuccessState(this.trips);
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState(this.message);
}

class HomeLoadingState extends HomeStates {}