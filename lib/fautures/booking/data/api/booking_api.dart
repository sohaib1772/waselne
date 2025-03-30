


import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';

part 'booking_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class BookingApi{
  factory BookingApi(Dio dio, {String baseUrl}) = _BookingApi;


  @POST("booking")
  Future<void> bookTrip(@Body() Map<String,dynamic> body);

  @POST("trips/saved")
  Future<void> saveTrip(@Body() Map<String,dynamic> body);
  
  @POST("trips/remove")
  Future<void> unSaveTrip(@Body() Map<String,dynamic> body);
 
}