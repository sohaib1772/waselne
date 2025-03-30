import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/data/my_booking_repository.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';

class MyBookingCubit extends Cubit<MyBookingStates> {
  MyBookingCubit(this.myBookingRepository) : super(MyBookingInitial());

  MyBookingRepository myBookingRepository;
  Future<void> getMyBooking() async {
    emit(MyBookingLoading());
    ApiResult result = await myBookingRepository.getMyBooking();

    if (result.success!) {
      emit(MyBookingSuccess(result.data));
    } else {
      emit(MyBookingError(result.message));
    }
  }

  Future<void> editMyBooking(
    int id,
    int seatsNumber,
    int tripId,
    String? details,
  ) async {
    emit(MyBookingLoading());
    ApiResult result = await myBookingRepository.editMyBooking(id, {
      "id": id,
      "seats_number": seatsNumber,
      "trip_id": tripId,
      "nots": details,
    });
    if (result.success!) {
      emit(MyBookingSuccess(result.data));
    } else {
      emit(MyBookingError(result.message));
    }
  }
  Future<void> deleteMyBooking(
    int id,
    int tripId,
  ) async {
    emit(MyBookingLoading());
    ApiResult result = await myBookingRepository.deleteMyBooking(id, {
      "id": id,
      "trip_id": tripId,
    });
    if (result.success!) {
      emit(MyBookingDeleteSuccess());
    } else {
      emit(MyBookingError(result.message));
    }
  }
}
