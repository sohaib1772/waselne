

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';

part 'sign_up_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class SignUpApi {
  factory SignUpApi(Dio dio, {String? baseUrl}) = _SignUpApi;

  @POST('/sign-up')
  Future<void> signUp(@Body() Map<String, dynamic> body);
}