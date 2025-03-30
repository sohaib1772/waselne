import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/home/data/home_repository_impl.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/booking/data/booking_repository.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit(this.tripRepository) : super(BookingInitialState());
  
  BookingRepository tripRepository;

  Future<void> bookTrip({required int seatCount,String? details,required int tripId})async{
    emit(BookingLoadingState());
    ApiResult result = await tripRepository.bookTrip({"seats_number":seatCount,"nots":details,"trip_id":tripId});
    if(result.success!){
      emit(BookingSuccessState());
    }else{
      emit(BookingErrorState(result.message ?? ""));
    }
  }

  Future<void> saveTrip({required int tripId})async{
    emit(BookingLoadingState());
    ApiResult result = await tripRepository.saveTrip({"tripId":tripId});
    if(result.success!){
      emit(BookingSaveTripSuccessState());
    }else{
      emit(BookingErrorState(result.message ?? ""));
    }
  }
  Future<void> unSaveTrip({required int tripId,})async{
    emit(BookingLoadingState());
    ApiResult result = await tripRepository.unSaveTrip({"tripId":tripId});
    if(result.success!){
      emit(BookingUnSaveTripSuccessState());
    }else{
      emit(BookingErrorState(result.message ?? ""));
    }
  }

}
