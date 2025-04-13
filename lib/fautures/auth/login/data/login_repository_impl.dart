import 'package:dio/dio.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/network/error_handler.dart';
import 'package:waselne/fautures/auth/login/data/api/login_api.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class LoginRepositoryImpl {
  LoginRepositoryImpl({required this.loginApi});
  final LoginApi loginApi;
  Future<ApiResult> login(String email, String password) async {
    try {
      var res = await loginApi.login({"email": email, "password": password});

      String token = res.data?.token ?? "";
      await AppLocalStorage.secureStorage.write(
        key: AppLocalStorageKeys.token,
        value: token,
      );
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) {
      if(e.response?.statusCode == 401){
        return ApiResult(data: null, code: 401, success: false,message: DioErrorCodes.handleValidationErrors(e.response!.data));
      }
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        success: false,
        dioError: e,

      );
    }
  }

  Future<ApiResult> loginWithGoogle({required String googleToken}) async {
    try {
      var res = await loginApi.loginWithGoogel({"googleToken": googleToken});

      String token = res.data?.token ?? "";
      await AppLocalStorage.secureStorage.write(
        key: AppLocalStorageKeys.token,
        value: token,
      );
      return ApiResult(data: res.data, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        dioError: e,
        success: false,
      );
    }
  }

  Future<ApiResult> uploadUserDevice(String fcmToken, String uuid) async {
    try {
      await loginApi.userDevice({"fcm_token": fcmToken, "uidd": uuid});
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        success: false,
        dioError: e,
      );
    }
  }
}
