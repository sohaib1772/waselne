import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/driver_profile/data/api/driver_profile_api.dart';

class DriverProfileRepository {

  DriverProfileRepository({required this.driverProfileApi});

  DriverProfileApi driverProfileApi;

  Future<ApiResult> addToFavorite(int driverId)async{
    try {
      await driverProfileApi.addToFavorite({"favorite_user_id":driverId});
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
  Future<ApiResult> removefromFavorite(int driverId)async{
    try {
      await driverProfileApi.removeFromFavorite(driverId);
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