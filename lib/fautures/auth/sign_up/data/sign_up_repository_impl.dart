

import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/sign_up/data/api/sign_up_api.dart';

class SignUpRepositoryImpl{

  SignUpRepositoryImpl({required this.signUpApi});
  final SignUpApi signUpApi;
  @override
  Future<ApiResult> signUp({required String email,required String password,required String passwordConfirmation})async { 
    try{
    await signUpApi.signUp({"email":email,"password":password,"password_confirmation":passwordConfirmation});
    return ApiResult(data: null, code: 200, message: "success", success: true);
    }on DioException catch(e){
      return ApiResult(data: null, code: e.response?.statusCode, message: e.response?.data['message'], success: false);
    }
  }


}