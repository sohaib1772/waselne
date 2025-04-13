import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/shared_api/shared_api.dart';
import 'package:waselne/fautures/favorites_drivers/data/api/favorites_drivers_api.dart';
import 'package:waselne/fautures/favorites_drivers/data/models/favorite_drivers_response_model.dart';

class FavoritesDriversRepository {
  FavoritesDriversApi api;
  FavoritesDriversRepository({required this.api});

  Future<ApiResult> getFavoritesDrivers() async {
    try {
      FavoriteDriversResponseModel res =  await api.getFavoritesDrivers();
      return ApiResult(data: res.data, success: true, code: 200);
    } on DioException catch (e) {
      return ApiResult(
        dioError: e,
        code: e.response?.statusCode,
        data: null,
        success: false,
      );
    }
  }

  
}