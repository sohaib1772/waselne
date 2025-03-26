import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/my_booking/data/api/my_booking_api.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';

class MyBookingRepository {
  MyBookingApi myBookingApi;
  MyBookingRepository(this.myBookingApi);

  Future<ApiResult> getMyBooking() async {
    try {
      MyBookingResponseModel response = await myBookingApi.getMyBooking();
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


  Future<ApiResult> editMyBooking(int id,Map<String,dynamic> map) async {
    try {
       await myBookingApi.editMyBooking(
       id.toString(),
      map
      );
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
  Future<ApiResult> deleteMyBooking(int id,Map<String,dynamic> map) async {
    try {
       await myBookingApi.deleteMyBooking(
       id.toString(),
      map
      );
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