import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/repositories/add_driver_to_favorite_repo.dart';
import 'package:waselne/fautures/driver_profile/data/driver_profile_repository.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_states.dart';

class DriverProfileCubit extends Cubit<DriverProfileStates>{
  DriverProfileCubit(this.driverInfoRepository,this.addDriverToFavoriteRepo):super(DriverProfileInitial());
  DriverProfileRepository driverInfoRepository;
  AddDriverToFavoriteRepo addDriverToFavoriteRepo;

  Future<void> getDriverInfo({required int driverID})async{
    emit(DriverProfileLoading());
    ApiResult result = await driverInfoRepository.getDriverProfile(driverID);
    if(result.success!){
      emit(DriverProfileSuccess(driver: result.data));
    }else{
      emit(DriverProfileError(message: result.message ?? ""));
    }
  }

  Future<void> addToFavorite(int driverId)async{
    emit(DriverProfileChangeFavoriteLoading());
    ApiResult result = await addDriverToFavoriteRepo.addToFavorite(driverId);
    if(result.success!){
      emit(DriverProfileAddToFavorite());
    }else{
      emit(DriverProfileError(message: result.message ?? ""));
    }
  }

  Future<void> removeFromFavorite(int driverId)async{
    emit(DriverProfileChangeFavoriteLoading());
    ApiResult result = await addDriverToFavoriteRepo.removefromFavorite(driverId);
    if(result.success!){
      emit(DriverProfileRemoveFromFavorite());
    }else{
      emit(DriverProfileError(message: result.message ?? ""));
    }
  }
}