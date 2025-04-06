import 'package:dio/dio.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/login/data/api/login_api.dart';

class LoginRepositoryImpl{

  LoginRepositoryImpl({required this.loginApi});
  final LoginApi loginApi;
  Future<void> login(String email, String password) { // here it's should be return Future<LoginModel>
    return loginApi.login({"email":email,"password":password});
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

  Future<ApiResult> uploadUserDevice(String fcmToken,String uuid)async{
    try {
      await loginApi.userDevice({"fcm_token": fcmToken,"uidd":uuid});
      return ApiResult(data: null, code: 200, success: true);
    } on DioException catch (e) { 

      return ApiResult(data: null, code: e.response?.statusCode, success: false,dioError: e);

    }

  }
}