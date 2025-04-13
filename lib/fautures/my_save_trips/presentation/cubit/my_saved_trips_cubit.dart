import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/repositories/save_unsave_trips_repo.dart';
import 'package:waselne/fautures/my_save_trips/data/my_saved_trips_repository.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_states.dart';

class MySavedTripsCubit extends Cubit<MySavedTripsStates> {
  MySavedTripsCubit(this.mySavedTripsRepository,this.saveUnsaveTripsRepo) : super(MySavedTripsInitial());

  MySavedTripsRepository mySavedTripsRepository;
  SaveUnsaveTripsRepo saveUnsaveTripsRepo;
  Future<void> getMySavedTrips({emitLoading = true}) async {
    if (emitLoading) {
    emit(MySavedTripsLoading());
    }
    ApiResult result = await mySavedTripsRepository.getMySavedTrips();

    if (result.success!) {
      emit(MySavedTripsSuccess(result.data));
    } else {
      emit(MySavedTripsError(result.message));
    }
  }

  Future<void> removeMySavedTrip(
    recordId,
  ) async {
    emit(MySavedTripsSaveLoadingState(recordId));
    ApiResult result = await saveUnsaveTripsRepo.unSaveTrip({"tripId":recordId});
    if (result.success!) {
      getMySavedTrips(emitLoading: false);
    } else {
      emit(MySavedTripsError(result.message));
    }
  }
}
