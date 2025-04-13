import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/data/my_booking_repository.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';

enum BookingStatus { all, pending, accepted, rejected }

class MyBookingCubit extends Cubit<MyBookingStates> {
  MyBookingCubit(this.myBookingRepository) : super(MyBookingInitial());

  BookingStatus bookingStatus = BookingStatus.all;
  MyBookingRepository myBookingRepository;


  

  List<TripsDateGroupModel> tripsDateGroupModel = [];
  Future<void> changeBookingStatus(BookingStatus status) async {
    bookingStatus = status;
    emit(MyBookingChangeStatus());
  }

  Future<void> getMyBooking() async {
    emit(MyBookingLoading());
    ApiResult result = await myBookingRepository.getMyBooking();

    if (result.success!) {
      tripsDateGroupModel = result.data;
      emit(MyBookingSuccess(result.data));
    } else {
      emit(MyBookingError(result.message));
    }
  }

  List<MyTripBookingModel> filterMyBooking(int index) {
    switch (bookingStatus) {
      case BookingStatus.all:
        return tripsDateGroupModel[index].mybooking ?? [];
      case BookingStatus.pending:
        return tripsDateGroupModel[index].mybooking
                ?.where((e) => e.status == "pending")
                .toList() ??
            [];
      case BookingStatus.accepted:
        return tripsDateGroupModel[index].mybooking
                ?.where((e) => e.status == "accepted")
                .toList() ??
            [];
      case BookingStatus.rejected:
        return tripsDateGroupModel[index].mybooking
                ?.where((e) => e.status == "rejected")
                .toList() ??
            [];
    }
  }

  Future<void> editMyBooking({
    required id,
    required seatsNumber,
    required tripId,
    required details,
  }
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

  Future<void> deleteMyBooking(int id, int tripId) async {
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
