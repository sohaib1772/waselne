


import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
part 'driver_profile_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class DriverProfileApi {

  factory DriverProfileApi(Dio dio, {String baseUrl}) = _DriverProfileApi;

  @POST("favorite")
  Future<void> addToFavorite(Map<String,dynamic> body);

  @DELETE("favorite/{id}")
  Future<void> removeFromFavorite(@Path("id") int id);

}