import 'package:kebormed/core/constants/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences? prefs;

  static Future<void> initializePrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveCredentials(
      String username, String password, bool isRemember, String token) async {
    await prefs?.setString(Prefkeys.username, username);
    await prefs?.setString(Prefkeys.password, password);
    await prefs?.setBool(Prefkeys.remember, isRemember);
    await prefs?.setString(Prefkeys.token, token);
  }

  static String? getUsername() {
    return prefs?.getString(Prefkeys.username);
  }

  static String? getPassword() {
    return prefs?.getString(Prefkeys.password);
  }

  static bool? getRememberMe() {
    return prefs?.getBool(Prefkeys.remember);
  }

  static String? getToken() {
    return prefs?.getString(Prefkeys.token);
  }

  static Future<void> clearCredentials() async {
    await prefs?.remove(Prefkeys.username);
    await prefs?.remove(Prefkeys.password);
    await prefs?.remove(Prefkeys.remember);
    await prefs?.remove(Prefkeys.token);
  }
}
