

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';
part 'shared_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class SharedApi {
  factory SharedApi(Dio dio, {String baseUrl}) = _SharedApi;

  @POST("favorite")
  Future<void> addToFavorite(@Body() Map<String,dynamic> body);

  @POST("favorite/remove")
  Future<void> removeFromFavorite(@Body() Map<String,dynamic> id);

  @POST("trips/saved")
  Future<void> saveTrip(@Body() Map<String,dynamic> body);
  
  @POST("trips/remove")
  Future<void> unSaveTrip(@Body() Map<String,dynamic> body);
}