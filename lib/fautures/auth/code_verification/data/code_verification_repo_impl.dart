import 'package:dio/dio.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/code_verification/data/api/code_verification_api.dart';
import 'package:waselne/fautures/auth/code_verification/domain/code_verification_repo.dart';

class CodeVerificationRepoImpl{
  CodeVerificationRepoImpl(this.codeVerificationApi);
  CodeVerificationApi codeVerificationApi;
  @override
  Future<ApiResult> emailVerification(String email,int code) async {

    try{
    final res = await codeVerificationApi.emailVerification({"code": code,"email":email});
      String token = res.data?.authorisation['token'];
      await AppLocalStorage.secureStorage.write(key: AppLocalStorageKeys.token, value: token);
      return ApiResult(data: token, code: 200, message: res.message, success: true);
    }on DioException catch(e){
      return ApiResult(data: null, code: e.response!.statusCode, message: e.response!.data['message'], success: false);
    }

  }

  @override
  Future<void> passwordVerification(String code) async {
    await codeVerificationApi.passwordVerification({"code": code});
  }
}
