
import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/shared_api.dart';

class AddDriverToFavoriteRepo {
  final SharedApi sharedApi;
AddDriverToFavoriteRepo(this.sharedApi);
  Future<ApiResult> addToFavorite(int driverId)async{
    try {
      await sharedApi.addToFavorite({"favorite_user_id":driverId.toString()});
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
      await sharedApi.removeFromFavorite({"favorite_user_id":driverId.toString()});
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