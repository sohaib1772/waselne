import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/favorites_drivers/data/api/favorites_drivers_api.dart';

class FavoritesDriversRepository {
  FavoritesDriversApi api;

  FavoritesDriversRepository({required this.api});

  Future<ApiResult> getFavoritesDrivers() async {
    try {
      await api.getFavoritesDrivers();
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