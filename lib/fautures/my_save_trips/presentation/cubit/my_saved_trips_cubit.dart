import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/my_save_trips/data/my_saved_trips_repository.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_states.dart';

class MySavedTripsCubit extends Cubit<MySavedTripsStates> {
  MySavedTripsCubit(this.mySavedTripsRepository) : super(MySavedTripsInitial());

  MySavedTripsRepository mySavedTripsRepository;
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
    int recordId,
  ) async {
    emit(MySavedTripsLoading());
    ApiResult result = await mySavedTripsRepository.removeSavedTrip(recordId);
    if (result.success!) {
      getMySavedTrips(emitLoading: false);
    } else {
      emit(MySavedTripsError(result.message));
    }
  }
}
