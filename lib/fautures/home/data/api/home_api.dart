


import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
part 'home_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class HomeApi{
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET('/trip') // get all trips with parameters
  Future<HomeResponseModel> getTrips(
    {@Query('from') String? from,
    @Query('to') String? to,
    @Query('trip_start') String? date,
    @Query('status') String? time,
    @Query('seat_price') double? type,
    @Query('available_seats') int? availableSeats,
    @Query('page') int? page}
  );
}