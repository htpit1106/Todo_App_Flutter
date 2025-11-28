
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Udid {
  Udid._();
  static Future<String> initPlatformState() async {
    String userId;
    try{
      userId = await FlutterUdid.udid;
    } on PlatformException {
      userId = 'Failed to get UDID';
    }
    return userId;
  }

  // save udid in shared preference

  static Future<void> setUserIdPref(String userId) async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString('user_id', userId);
  }

  // get udid from shared preference
  static  Future<String?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('user_id');
  }

}