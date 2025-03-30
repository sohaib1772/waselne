

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static final secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

static SharedPreferences prefs = null as SharedPreferences;

static Future<void> initSharedPrefrences() async {
  prefs = await SharedPreferences.getInstance();
}
}

class AppLocalStorageKeys{
  static String token = "token";
  static String lang = "lang";
}