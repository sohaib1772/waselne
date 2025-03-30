sealed class FavoritesDriversStates {
}

class FavoritesDriversInitial extends FavoritesDriversStates {}

class FavoritesDriversLoading extends FavoritesDriversStates {}

class FavoritesDriversError extends FavoritesDriversStates {
  String? message;

  FavoritesDriversError({this.message});
}

class FavoritesDriversSuccess extends FavoritesDriversStates {}