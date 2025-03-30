import 'package:dio/dio.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/sign_up/data/api/sign_up_api.dart';

class SignUpRepositoryImpl {
  SignUpRepositoryImpl({required this.signUpApi});
  final SignUpApi signUpApi;

  Future<ApiResult> signUp({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      await signUpApi.signUp({
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) {
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        dioError: e,
        success: false,
      );
    }
  }

  Future<ApiResult> loginWithGoogle({required String googleToken}) async {
    try {
      var res = await signUpApi.loginWithGoogel({"googleToken": googleToken});

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
  Future<ApiResult> uploadUserDevice(String fcmToken,String uuid)async{
    try {
      await signUpApi.userDevice({"fcm_token": fcmToken,"uidd":uuid});
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) { 

      return ApiResult(data: null, code: e.response?.statusCode, success: true,dioError: e);

    }

  }
}
