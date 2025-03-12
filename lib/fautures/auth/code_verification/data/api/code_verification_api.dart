

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/auth/code_verification/data/models/code_verification_response_model.dart';

part 'code_verification_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class CodeVerificationApi {
  factory CodeVerificationApi(Dio dio, {String? baseUrl}) = _CodeVerificationApi;

  @POST('verify-email/2')
  Future<CodeVerificationResponseModel> emailVerification(@Body() Map<String, dynamic> body);

  @POST('password-verification')
  Future<void> passwordVerification(@Body() Map<String, dynamic> body);
}