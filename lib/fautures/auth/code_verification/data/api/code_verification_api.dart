

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/auth/code_verification/data/models/create_account_response_model.dart';

part 'code_verification_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class CodeVerificationApi {
  factory CodeVerificationApi(Dio dio, {String? baseUrl}) = _CodeVerificationApi;

  @POST('verify-email')
  Future<CreateAccountResponseModel> emailVerification(@Body() Map<String, dynamic> body);

  @POST('checkCode')
  Future<void> passwordVerification(@Body() Map<String, dynamic> body);

  @POST('resendCode')
  Future<void> resendCode(@Body() Map<String, dynamic> body);
  
  @POST('checkEmail')
  Future<void> resendPasswordCode(@Body() Map<String, dynamic> body);

  @POST("userdevice")
  Future<void> userDevice(@Body() Map<String, dynamic> body);
}