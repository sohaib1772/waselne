import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/home/data/api/home_api.dart';

class HomeRepositoryImpl {
  final HomeApi _homeApi;

  HomeRepositoryImpl(this._homeApi);

  Future<ApiResult> getHomeData({int? nextPage}) async {
    try {
      final response = await _homeApi.getTrips(page: nextPage);
      return ApiResult(data: response, success: true, code: 200);
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
