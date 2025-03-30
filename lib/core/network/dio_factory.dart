import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';

class DioFactory {
  static Dio? _dio;

  static Future<Dio> getDio() async{
    _dio ??= await setUpDio();
    return _dio!;
  }

  static Future<Dio> setUpDio()async {
    Dio dio = Dio(

      BaseOptions(
        connectTimeout: Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          

          //Todo : add token
          options.headers['Authorization'] = "Bearer ${await AppLocalStorage.secureStorage.read(key:AppLocalStorageKeys.token) ?? ""}";
          options.headers['Accept-Language'] = await AppLocalStorage.secureStorage.read(key:AppLocalStorageKeys.lang)?? "en";
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) {
          //Todo : check access token
          if (error.response?.statusCode == 401) {
          }
          return handler.next(error);
        },
        onResponse: (response, handler) {
          //AppLocalStorage.secureStorage.write(key: AppLocalStorageKeys.token, value: response.headers["authorization"]?.first);
          return handler.next(response);
        }
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
