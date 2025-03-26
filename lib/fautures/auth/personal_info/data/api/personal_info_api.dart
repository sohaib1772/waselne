

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waselne/core/shared/app_constans.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/perosnal_info_response_model.dart';

part 'personal_info_api.g.dart';
@RestApi(baseUrl: AppConstans.baseUrl)
abstract class PersonalInfoApi {
  factory PersonalInfoApi(Dio dio, {String? baseUrl}) = _PersonalInfoApi;

  @POST('profile')
  Future<PersonalInfoResponseModel> createProfile(@Body() Map<String, dynamic> body);

  @GET('countries')
  Future<CitiesResponseModel> getCountries();
}

