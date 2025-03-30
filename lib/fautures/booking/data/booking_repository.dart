import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/booking/data/api/booking_api.dart';

class BookingRepository {
  BookingApi tripApi;
  BookingRepository(this.tripApi);

  Future<ApiResult> bookTrip(Map<String, dynamic> body) async {
    try {
      final response = await tripApi.bookTrip(body);
      return ApiResult(code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }

  Future<ApiResult> saveTrip(Map<String, dynamic> body) async {
    try {
      await tripApi.saveTrip(body);
      return ApiResult(data: 1, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }

  Future<ApiResult> unSaveTrip(Map<String, dynamic> body) async {
    try {
      await tripApi.unSaveTrip(body);
      return ApiResult(data: 0, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }
}
