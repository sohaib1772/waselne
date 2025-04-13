import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/helpers/app_secure/api/app_secure_api.dart';
import 'package:waselne/core/helpers/app_secure/app_secure_repository.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/core/network/api_reasult.dart';

class AppSecure {
  static bool _isValidToken = false;
  static bool get isValidToken => _isValidToken;

  // check if token is valid
  static Future<void> checkToken() async {
    //get token from locale storage
    print("===== getting token from locale storage to check it");
    String? token = await AppLocalStorage.secureStorage.read(
      key: AppLocalStorageKeys.token,
    );

    // if token is null redirect to login in goRouter initial page
    if (token == null) return;

    // if token in storage check if it's expire or not
    //return true and redirect to home page if everything good
    _isValidToken = await refreshTokenRequest(token: token);
    return;
  }

  static Future<bool> refreshTokenRequest({String? token}) async {
    // check if the token is expired
    // if the token not sent in parameters get it from locale storage

    print("===== getting token from locale storage to check it");
    token ??= await AppLocalStorage.secureStorage.read(
        key: AppLocalStorageKeys.token,
      );
    
    if (token == null) return false;
    if (!JwtDecoder.isExpired(token)) return true;

    print("===== token is expired request to refresh token");
    // call refresh token api
    ApiResult res = await AppSecureRepository(
      api: getIt(),
    ).refreshTokenRequest(token ?? "");

    // if the token is refreshed successfully save it in locale storage
    if (res.success!) {
      print("===== save new token");
      await saveNewToken(res.data?.token);
      return true;
    }

    print("===== token is not refreshed successfully");
    // if the token is not refreshed successfully remove it from locale storage
    await deleteSecuredToken();
    return false;
  }

  // save new token in locale storage
  static Future<void> saveNewToken(String? token) async {
    await AppLocalStorage.secureStorage.write(
      key: AppLocalStorageKeys.token,
      value: token,
    );
  }

  // deleted token form locale storage
  static Future<void> deleteSecuredToken() async {
    await AppLocalStorage.secureStorage.delete(key: AppLocalStorageKeys.token);
  }

  static Future<String?> getToken() async {
    return await AppLocalStorage.secureStorage.read(
      key: AppLocalStorageKeys.token,
    );
  }
}
