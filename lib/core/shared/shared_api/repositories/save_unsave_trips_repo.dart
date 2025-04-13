import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/shared_api.dart';

class SaveUnsaveTripsRepo {


  SharedApi sharedApi;
  SaveUnsaveTripsRepo(this.sharedApi);
  Future<ApiResult> saveTrip(Map<String, dynamic> body) async {
    try {
      await sharedApi.saveTrip(body);
      return ApiResult(data: 1, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }

  Future<ApiResult> unSaveTrip(Map<String, dynamic> body) async {
    try {
      await sharedApi.unSaveTrip(body);
      return ApiResult(data: 0, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }
}