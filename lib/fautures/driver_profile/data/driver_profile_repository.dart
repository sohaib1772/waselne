import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/shared_api.dart';
import 'package:waselne/fautures/driver_profile/data/api/driver_profile_api.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_response_model.dart';

class DriverProfileRepository {

  DriverProfileRepository({required this.driverProfileApi});

  DriverProfileApi driverProfileApi;
  Future<ApiResult> getDriverProfile(int driverId)async{
    try {
      DriverResponseModel res = await driverProfileApi.getDriverInfo(driverId);
      return ApiResult(data: res.data, success: true, code: 200);
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