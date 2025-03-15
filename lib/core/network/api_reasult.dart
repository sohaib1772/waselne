

import 'package:dio/dio.dart';
import 'package:waselne/core/network/error_handler.dart';

class ApiResult<T> {
  T? data;
  String? message;
  int? code;
  bool? success;
  DioException? dioError;
  ApiResult({this.data,this.dioError,this.message, this.code, this.success}){
    if(dioError != null){
      message = ErrorHandler.handleDioError(dioError);
    }
  }
}