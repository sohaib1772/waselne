import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/fautures/home/data/home_repository_impl.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/booking/data/booking_repository.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit(this.tripRepository) : super(BookingInitialState());
  
  BookingRepository tripRepository;


  bool checkStartPoint = false;
  bool checkEndPoint = false;

  TextEditingController detailsController = TextEditingController();
  TextEditingController seatsCountController = TextEditingController(text: "1");

  void changeSeatsCount(int seatCount){
    seatsCountController.text = seatCount.toString();
    emit(BookingChagneSeatsCountState());
  }
  void changeCheckStartPoint(bool value){
    checkStartPoint = value;
    emit(BookignChangeCheckStates(startPoint: checkStartPoint,endPoint: checkEndPoint));
  }

  void changeCheckEndPoint(bool value){
    checkEndPoint = value;
    emit(BookignChangeCheckStates(endPoint: checkEndPoint,startPoint: checkStartPoint));
  }

  Future<void> bookTrip({required int tripId})async{
    emit(BookingLoadingState());
    ApiResult result = await tripRepository.bookTrip({"seats_number":int.tryParse(seatsCountController.text)??0,"nots":detailsController.text??"","trip_id":tripId});
    if(result.success!){
      emit(BookingSuccessState());
    }else{
      emit(BookingErrorState(result.message ?? ""));
    }
  }

  Future<void> saveTrip({required TripModel tripModel})async{
    emit(BookignSaveTripLoadingState());
    ApiResult result = await tripRepository.saveTrip({"tripId":tripModel.id});
    if(result.success!){
      tripModel.isSaved =1 ;
      emit(BookingSaveTripSuccessState());
    }else{
      emit(BookingErrorState(result.message ?? ""));
    }
  }
  Future<void> unSaveTrip({required TripModel tripModel,})async{
    emit(BookignSaveTripLoadingState());
    ApiResult result = await tripRepository.unSaveTrip({"tripId":tripModel.id});
    if(result.success!){
      tripModel.isSaved = 0;
      emit(BookingUnSaveTripSuccessState());
    }else{
      emit(BookingErrorState(result.message ?? ""));
    }
  }

}
