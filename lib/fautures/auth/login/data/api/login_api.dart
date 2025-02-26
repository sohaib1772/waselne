

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';

part 'login_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String? baseUrl}) = _LoginApi;

  @POST('/login')
  Future<void> login(@Body() Map<String, dynamic> body);

  @POST('/login-google')
  Future<void> loginViaGoogle(@Body() Map<String, dynamic> body);
}