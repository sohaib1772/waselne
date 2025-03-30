
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';

part 'my_booking_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class MyBookingApi{
  factory MyBookingApi(Dio dio, {String baseUrl}) = _MyBookingApi;
  
  @GET("booking")
  Future<MyBookingResponseModel>getMyBooking();

  @PUT("booking/{id}")
  Future<void>editMyBooking(@Path("id") String id,@Body() Map<String,dynamic> body);

  @DELETE("booking/{id}")
  Future<void>deleteMyBooking(@Path("id") String id,@Body() Map<String,dynamic> body);

}