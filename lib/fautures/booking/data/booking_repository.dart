import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/booking/data/api/booking_api.dart';

class BookingRepository {
  BookingApi tripApi;
  BookingRepository(this.tripApi);

  Future<ApiResult> bookTrip(Map<String,dynamic> body)async{
    try {
      final response = await tripApi.bookTrip(body);
      return ApiResult(
        code: 200,
        success: true,
      );
    }on DioException catch(e){
      return ApiResult(
        success: false,
        dioError: e,
        
      );
    }
  }
}