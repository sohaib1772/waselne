


import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_response_model.dart';
part 'driver_profile_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class DriverProfileApi {

  factory DriverProfileApi(Dio dio, {String baseUrl}) = _DriverProfileApi;

  @GET("user/{id}")
  Future<DriverResponseModel> getDriverInfo(@Path("id") int id);
}