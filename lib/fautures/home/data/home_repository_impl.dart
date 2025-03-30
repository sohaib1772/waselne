import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/home/data/api/home_api.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';

class HomeRepositoryImpl {
  final HomeApi _homeApi;

  HomeRepositoryImpl(this._homeApi);

  Future<ApiResult> getHomeData({
    int? nextPage,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _homeApi.getTrips(
        page: nextPage,
        from: params?['from'],
        to: params?['to'],
        seatPrice: params?['seatPrice'],
        date: params?['startDate'],
        time: params?['startTime'],
        availableSeats: params?['availableSeats'],
      );
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

  Future<ApiResult> getCities() async {
    try {
      HomeCitiesResponseModel data = await _homeApi.getCities();
      return ApiResult(data: data.data, success: true, code: 200);
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
