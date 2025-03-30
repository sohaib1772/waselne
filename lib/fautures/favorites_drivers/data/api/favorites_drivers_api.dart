

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
part 'favorites_drivers_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class FavoritesDriversApi{
  factory FavoritesDriversApi(Dio dio,{String baseUrl}) = _FavoritesDriversApi;

  @GET("favorite")
  Future<void> getFavoritesDrivers();
}