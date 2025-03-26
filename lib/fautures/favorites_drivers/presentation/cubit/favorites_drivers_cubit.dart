import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/favorites_drivers/data/favorites_drivers_repository.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_states.dart';

class FavoritesDriversCubit extends Cubit<FavoritesDriversStates> {
  FavoritesDriversCubit(this.favoritesDriversRepository) : super(FavoritesDriversInitial());

  FavoritesDriversRepository favoritesDriversRepository;

  Future<void> getAllFavoritesDrivers()async{
    emit(FavoritesDriversLoading());
    ApiResult data = await favoritesDriversRepository.getFavoritesDrivers();

    if(data.success!){
      emit(FavoritesDriversSuccess());
    }else{
      emit(FavoritesDriversError(message: data.message!));
    }
  }

}