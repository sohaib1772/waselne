
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsApi {
 static final _messaging = FirebaseMessaging.instance;
  static String? _fcmToken;
  static String? _uuid;
  static String? getUUID() => _uuid;
  static String? getFCMToken() => _fcmToken;
  static Future<void> initNotifications()async{
    await _messaging.requestPermission();
    _fcmToken = await _messaging.getToken();
    _uuid = await _getId();
  }

 static Future<String?> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
}
 }