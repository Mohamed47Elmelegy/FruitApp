import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  static getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }
}
