import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _firstRunKey = "first_run";
  static const _isOnboardingKey = "is_onboarding";
  static const _currentLanguageKey = 'current_language';


  static Future <bool> isFirstRun() async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_firstRunKey) ?? true;
    } catch (e) {
      return false;
    }
  }

  static Future <void> setFirstRun({bool isFistRun = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstRunKey, isFistRun);
  }

  static Future<bool> isOnboarded () async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isOnboardingKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> setOnboarded({bool isOnboarded = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isOnboardingKey, isOnboarded);
  }
}