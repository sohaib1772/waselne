

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/helpers/app_secure/models/app_seceure_refresh_token_model.dart';
import 'package:waselne/core/shared/app_constans.dart';
part 'app_secure_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class AppSecureApi {

  factory AppSecureApi(Dio dio, {String baseUrl}) = _AppSecureApi;

  @POST("refresh")
  Future<AppSeceureRefreshTokenModel> refresh();
}