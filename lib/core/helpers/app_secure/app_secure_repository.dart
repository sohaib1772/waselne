


import 'package:dio/dio.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/helpers/app_secure/api/app_secure_api.dart';
import 'package:waselne/core/helpers/app_secure/app_secure.dart';
import 'package:waselne/core/helpers/app_secure/models/app_seceure_refresh_token_model.dart';
import 'package:waselne/core/network/api_reasult.dart';

class AppSecureRepository {
  AppSecureApi api;
  AppSecureRepository({required this.api});

  Future<ApiResult> refreshTokenRequest(String token)async{
    try {
      AppSeceureRefreshTokenModel res = await api.refresh();
      await AppSecure.saveNewToken(res.data?.token);
      return ApiResult(data: res.data, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(data: null, code: e.response?.statusCode, success: false, dioError: e);
    }
  }
}