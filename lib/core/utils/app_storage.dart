import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences? prefs;

  static Future<void> initializePrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }
}
