import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/driver_profile/data/driver_profile_repository.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_states.dart';

class DriverProfileCubit extends Cubit<DriverProfileStates>{
  DriverProfileCubit(this.driverInfoRepository):super(DriverProfileInitial());
  DriverProfileRepository driverInfoRepository;

  Future<void> addToFavorite(int driverId)async{
    emit(DriverProfileLoading());
    ApiResult result = await driverInfoRepository.addToFavorite(driverId);
    if(result.success!){
      emit(DriverProfileAddToFavorite());
    }else{
      emit(DriverProfileError(message: result.message ?? ""));
    }
  }

  Future<void> removeFromFavorite(int driverId)async{
    emit(DriverProfileLoading());
    ApiResult result = await driverInfoRepository.removefromFavorite(driverId);
    if(result.success!){
      emit(DriverProfileRemoveFromFavorite());
    }else{
      emit(DriverProfileError(message: result.message ?? ""));
    }
  }
}