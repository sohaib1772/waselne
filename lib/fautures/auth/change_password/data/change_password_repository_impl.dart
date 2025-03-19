import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/change_password/data/api/change_password_api.dart';

class ChangePasswordRepositoryImpl{

  ChangePasswordRepositoryImpl({required this.changePasswordApi});
  final ChangePasswordApi changePasswordApi;

  Future<ApiResult> checkEmail({required String email}) async {
    try {
      var res = await changePasswordApi.checkEmail({"email": email});

     
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
  Future<ApiResult> changePassword({required String email,required String password,required String confirmPassowrd,required String code}) async {
    try {
      var res = await changePasswordApi.changePassword({"email": email,"password":password,"password_confirmation":confirmPassowrd,"code":code});

     
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
}