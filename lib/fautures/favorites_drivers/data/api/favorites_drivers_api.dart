

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/favorites_drivers/data/models/favorite_drivers_response_model.dart';
part 'favorites_drivers_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class FavoritesDriversApi{
  factory FavoritesDriversApi(Dio dio,{String baseUrl}) = _FavoritesDriversApi;

  @GET("favorite")
  Future<FavoriteDriversResponseModel> getFavoritesDrivers();
}