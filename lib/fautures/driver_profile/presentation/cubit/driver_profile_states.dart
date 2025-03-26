import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

sealed class DriverProfileStates{}

class DriverProfileInitial extends DriverProfileStates{}

class DriverProfileLoading extends DriverProfileStates{}

class DriverProfileError extends DriverProfileStates{
  String? message;

  DriverProfileError({this.message});
}

class DriverProfileSuccess extends DriverProfileStates{

}
class DriverProfileAddToFavorite extends DriverProfileStates{}

class DriverProfileRemoveFromFavorite extends DriverProfileStates{}
class DriverProfileGetCurrentTripsSuccess extends DriverProfileStates{
  List<HomeTripModel> data;

  DriverProfileGetCurrentTripsSuccess({required this.data});
}
class DriverProfileGetAllTripsSuccess extends DriverProfileStates{
  List<HomeTripModel> data;

  DriverProfileGetAllTripsSuccess({required this.data});
}
