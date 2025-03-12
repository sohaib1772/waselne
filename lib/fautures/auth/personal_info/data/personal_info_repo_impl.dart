

import 'package:dio/dio.dart';
import 'package:waselne/core/network/api_reasult.dart';
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
        message: data.message,
        success: true
      );
    }on DioException catch(e){
      return ApiResult(
        data: null,
        code: e.response?.statusCode,
        message: e.response?.data['message'],
        success: false
      );
    }
    
  }


}