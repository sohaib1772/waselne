

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/auth/code_verification/data/models/create_account_response_model.dart';

part 'login_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String? baseUrl}) = _LoginApi;

  @POST('/login')
  Future<void> login(@Body() Map<String, dynamic> body);


  @POST('loginwithGoogel')
  Future<CreateAccountResponseModel> loginWithGoogel(@Body() Map<String, dynamic> body);

  @POST("/userdevice")
  Future<void> userDevice(@Body() Map<String, dynamic> body);
}