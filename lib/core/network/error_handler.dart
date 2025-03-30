


import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ErrorHandler {
  
  static String handleDioError(DioException? error) {
    if (error == null) {
      return 'Unknown error occurred';
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return LocaleKeys.dioErrors_connectionTimeout.tr();
      case DioExceptionType.sendTimeout:
        return LocaleKeys.dioErrors_sendTimeout.tr();
      case DioExceptionType.receiveTimeout:
        return LocaleKeys.dioErrors_receiveTimeout.tr();
      case DioExceptionType.badCertificate:
        return LocaleKeys.dioErrors_badCertificate.tr();
      case DioExceptionType.badResponse:
        return DioErrorCodes.handler(error.response);
      case DioExceptionType.cancel:
        return LocaleKeys.dioErrors_cancel.tr();
      case DioExceptionType.connectionError:
        return LocaleKeys.dioErrors_connectionError.tr();
      case DioExceptionType.unknown:
        return LocaleKeys.dioErrors_unknownError.tr();
    }
  }
}

class DioErrorCodes{
  static String handler(Response<dynamic>? res){
    
    if (res == null) {
      print("xaaaaaaaaaaaaaaaaaaaa");
      return LocaleKeys.dioErrors_unknownError.tr();
    }
    switch (res.statusCode) {
      case 400:
        return _handleValidationErrors(res.data);
      case 401:
        return LocaleKeys.dioErrors_unknownError.tr();
      case 403:
        return LocaleKeys.dioErrors_forbidden.tr();
      case 409:
        return _handleValidationErrors(res.data);
      case 404:
        return LocaleKeys.dioErrors_notFound.tr();
      case 422:
        return _handleValidationErrors(res.data);
      case 429:
        return LocaleKeys.dioErrors_tooManyRequests.tr();
      case 500:
        return LocaleKeys.dioErrors_internalServerError.tr();
      default:
        return LocaleKeys.dioErrors_unknownError.tr();
    }
  }

  static String _handleValidationErrors(dynamic data) {
    if (data is Map<String, dynamic> && (data.containsKey("errors") || data.containsKey("error"))) {
      var errors = {};
      if(data.containsKey("error")){
         errors = data["error"] as Map<String, dynamic>;
      }
      if(data.containsKey("errors")){
         errors = data["errors"] as Map<String, dynamic>;
      }
      
      final errorMessages = errors.entries.map((entry) {
        final messages = (entry.value as List).join("\n");
        return messages;
      }).join("\n\n");

      return errorMessages;
    }else if(data is Map<String, dynamic> && data.containsKey("message")){
      return data['message'];
    }
    return LocaleKeys.dioErrors_validationOccurred.tr();
  }
}



