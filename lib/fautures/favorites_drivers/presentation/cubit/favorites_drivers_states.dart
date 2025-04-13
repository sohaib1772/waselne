import 'package:waselne/fautures/favorites_drivers/data/models/favorite_drivers_response_model.dart';

sealed class FavoritesDriversStates {
}

class FavoritesDriversInitial extends FavoritesDriversStates {}

class FavoritesDriversLoading extends FavoritesDriversStates {}

class FavoritesDriversError extends FavoritesDriversStates {
  String? message;

  FavoritesDriversError({this.message});
}

class FavoritesDriversSuccess extends FavoritesDriversStates {
  List<FavoriteDriversModel>? drivers;

  FavoritesDriversSuccess({this.drivers});
}

class FavoriteDriversRemoveSuccess extends FavoritesDriversStates {}