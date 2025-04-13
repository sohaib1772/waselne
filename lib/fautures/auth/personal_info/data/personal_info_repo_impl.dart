

import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/data/api/personal_info_api.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/personal_info_model.dart';

class PersonalInfoRepoImpl{

  PersonalInfoRepoImpl(this.personalInfoApi);
  final PersonalInfoApi personalInfoApi;

  Future<ApiResult> createProfile(PersonalInfoModel body) async{ 

    try{

      final data = await personalInfoApi.createProfile(body.toJson());
      return ApiResult(
        data: data,
        code: 200,
        success: true
      );
    }on DioException catch(e){
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        dioError: e,
        success: false
      );
    }
    
  }

  Future<ApiResult> getCountries() async{
    try{
      CitiesResponseModel res = await personalInfoApi.getCountries();
      return ApiResult(
        data: res.data,
        code: 200,
        success: true
      );
    }on DioException catch(e){
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        dioError: e,
        success: false
      );
    }
  }


}