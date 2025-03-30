

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';

part 'change_password_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class ChangePasswordApi {
  factory ChangePasswordApi(Dio dio, {String? baseUrl}) = _ChangePasswordApi;

  @POST('checkEmail')
  Future<void> checkEmail(@Body() Map<String, dynamic> body);

  @POST('changePassword')
  Future<void> changePassword(@Body() Map<String, dynamic> body);
}