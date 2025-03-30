import 'package:dio/dio.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/code_verification/data/api/code_verification_api.dart';

class CodeVerificationRepoImpl {
  CodeVerificationRepoImpl(this.codeVerificationApi);
  CodeVerificationApi codeVerificationApi;
  @override
  Future<ApiResult> emailVerification(String email, int code) async {
    try {
      final res = await codeVerificationApi.emailVerification({
        "code": code,
        "email": email,
      });
      String token = res.data?.token ?? "";
      await AppLocalStorage.secureStorage.write(
        key: AppLocalStorageKeys.token,
        value: token,
      );
       
      return ApiResult(data: res.data, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response!.statusCode,
        dioError: e,
        success: false,
      );
    }
  }

  Future<ApiResult> resendCode(String email) async {
    try {
      await codeVerificationApi.resendCode({"email": email});
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response!.statusCode,
        dioError: e,
        success: false,
      );
    }
  }
  Future<ApiResult> resendPasswordCode(String email) async {
    try {
      await codeVerificationApi.resendCode({"email": email});
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response!.statusCode,
        dioError: e,
        success: false,
      );
    }
  }

  @override
  Future<ApiResult> passwordVerification(String code, String email) async {
    try {
      await codeVerificationApi.passwordVerification({
        "code": code,
        "email": email,
      });
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response!.statusCode,
        dioError: e,
        success: false,
      );
    }
  }

  Future<ApiResult> uploadUserDevice(String fcmToken,String uuid)async{
    try {
      await codeVerificationApi.userDevice({"fcm_token": fcmToken,"uidd":uuid});
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) { 

      return ApiResult(data: null, code: e.response?.statusCode, success: false,dioError: e);

    }

  }
}
