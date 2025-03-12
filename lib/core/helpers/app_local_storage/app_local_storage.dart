

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocalStorage {
  static final secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

}

class AppLocalStorageKeys{
  static String token = "token";
}