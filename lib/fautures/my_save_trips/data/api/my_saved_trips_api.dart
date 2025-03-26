
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/my_save_trips/data/models/my_saved_trips_response_model.dart';

part 'my_saved_trips_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class MySavedTripsApi{
  factory MySavedTripsApi(Dio dio, {String baseUrl}) = _MySavedTripsApi;
  
   @GET("trips/saved")
   Future<MySavedTripsResponseModel>getSavedTrips();

  @DELETE("trips/remove")
  Future<void>removeSavedTrip(@Body() Map<String,dynamic> body);

}