import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/my_booking/data/api/my_booking_api.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_save_trips/data/api/my_saved_trips_api.dart';
import 'package:waselne/fautures/my_save_trips/data/models/my_saved_trips_response_model.dart';

class MySavedTripsRepository {
  MySavedTripsApi mySavedTripsApi;
  MySavedTripsRepository(this.mySavedTripsApi);

  Future<ApiResult> getMySavedTrips() async {
    try {
      MySavedTripsResponseModel response = await mySavedTripsApi.getSavedTrips();
      return ApiResult(data: response.data, success: true, code: 200);
    } on DioException catch (e) {
      return ApiResult(
        dioError: e,
        code: e.response?.statusCode,
        data: null,
        success: false,
        message: e.toString(),
      );
    }
  }

  Future<ApiResult> removeSavedTrip(int id) async {
    try {
      await mySavedTripsApi.removeSavedTrip({"recordId":id});
      return ApiResult(data: null, success: true, code: 200);
    } on DioException catch (e) {
      return ApiResult(
        dioError: e,
        code: e.response?.statusCode,
        data: null,
        success: false,
        message: e.toString(),
      );
    }
  }


  
}