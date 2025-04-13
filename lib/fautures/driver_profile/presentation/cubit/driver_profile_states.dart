import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';

sealed class DriverProfileStates{}

class DriverProfileInitial extends DriverProfileStates{}

class DriverProfileLoading extends DriverProfileStates{}
class DriverProfileChangeFavoriteLoading extends DriverProfileStates{}

class DriverProfileError extends DriverProfileStates{
  String? message;

  DriverProfileError({this.message});
}

class DriverProfileSuccess extends DriverProfileStates{
  DriverModel? driver;

  DriverProfileSuccess({this.driver});

}
class DriverProfileAddToFavorite extends DriverProfileStates{}

class DriverProfileRemoveFromFavorite extends DriverProfileStates{}
class DriverProfileGetCurrentTripsSuccess extends DriverProfileStates{
  List<TripModel> data;

  DriverProfileGetCurrentTripsSuccess({required this.data});
}
class DriverProfileGetAllTripsSuccess extends DriverProfileStates{
  List<TripModel> data;

  DriverProfileGetAllTripsSuccess({required this.data});
}
