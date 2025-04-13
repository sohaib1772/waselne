import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/helpers/app_secure/app_secure.dart';

class DioFactory {
  static Dio? _dio;

  static Future<Dio> getDio() async {
    _dio ??= await setUpDio();
    return _dio!;
  }

  static Future<Dio> setUpDio() async {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 30),
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!options.path.contains("refresh")) {
              await AppSecure.refreshTokenRequest();
            
          }
          options.headers['Authorization'] =
              "Bearer ${await AppSecure.getToken() ?? ""}";
          options.headers['Accept-Language'] =
              await AppLocalStorage.secureStorage.read(
                key: AppLocalStorageKeys.lang,
              ) ??
              "en";
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) {
          //Todo : check access token
          if (error.response?.statusCode == 401) {}
          return handler.next(error);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
    // customization
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    return dio;
  }
}
