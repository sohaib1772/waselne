import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/models/cities_response_model.dart';
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
      );
    }
  }

  Future<ApiResult> getCities() async {
    try {
      CitiesResponseModel data = await _homeApi.getCities();
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

  Future<ApiResult> saveTrip(Map<String, dynamic> body) async {
    try {
      await _homeApi.saveTrip(body);
      return ApiResult(data: 1, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }

  Future<ApiResult> unSaveTrip(Map<String, dynamic> body) async {
    try {
      await _homeApi.unSaveTrip(body);
      return ApiResult(data: 0, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(success: false, dioError: e);
    }
  }
}
