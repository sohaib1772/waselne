import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/repositories/add_driver_to_favorite_repo.dart';
import 'package:waselne/fautures/favorites_drivers/data/favorites_drivers_repository.dart';
import 'package:waselne/fautures/favorites_drivers/data/models/favorite_drivers_response_model.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_states.dart';

class FavoritesDriversCubit extends Cubit<FavoritesDriversStates> {
  FavoritesDriversCubit(this.favoritesDriversRepository,this.addDriverToFavoriteRepo) : super(FavoritesDriversInitial());

  FavoritesDriversRepository favoritesDriversRepository;
  AddDriverToFavoriteRepo addDriverToFavoriteRepo;

  List<FavoriteDriversModel> drivers = [];
  Future<void> getAllFavoritesDrivers()async{
    emit(FavoritesDriversLoading());
    ApiResult res = await favoritesDriversRepository.getFavoritesDrivers();

    if(res.success!){
      drivers = res.data!;
      emit(FavoritesDriversSuccess(drivers: res.data!));
    }else{
      emit(FavoritesDriversError(message: res.message!));
    }
  } 
  Future<void> removeFromFavorite(FavoriteDriversModel driver)async{
    drivers.remove(driver);
          emit(FavoriteDriversRemoveSuccess());

    ApiResult result = await addDriverToFavoriteRepo.removefromFavorite(driver.id ?? 0);
    if(result.success!){
      emit(FavoriteDriversRemoveSuccess());
    }else{
      emit(FavoritesDriversError(message: result.message ?? ""));
    }
  }
  

}