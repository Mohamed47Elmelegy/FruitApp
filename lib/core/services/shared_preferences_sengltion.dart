import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;
  static bool _isInitialized = false;

  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
    } catch (e) {
      log('SharedPreferences initialization failed: $e');
      _isInitialized = false;
    }
  }

  static setBool(String key, bool value) async {
    if (!_isInitialized) return;
    try {
      await _prefs.setBool(key, value);
    } catch (e) {
      log('Error setting bool preference $key: $e');
    }
  }

  static getBool(String key) {
    if (!_isInitialized) return false;
    try {
      return _prefs.getBool(key) ?? false;
    } catch (e) {
      log('Error getting bool preference $key: $e');
      return false;
    }
  }

  static setString(String key, String value) async {
    if (!_isInitialized) return;
    try {
      await _prefs.setString(key, value);
    } catch (e) {
      log('Error setting string preference $key: $e');
    }
  }

  static getString(String key) {
    if (!_isInitialized) return null;
    try {
      return _prefs.getString(key);
    } catch (e) {
      log('Error getting string preference $key: $e');
      return null;
    }
  }

  static remove(String key) {
    if (!_isInitialized) return;
    try {
      _prefs.remove(key);
    } catch (e) {
      log('Error removing preference $key: $e');
    }
  }

  static clear() {
    if (!_isInitialized) return;
    try {
      _prefs.clear();
    } catch (e) {
      log('Error clearing preferences: $e');
    }
  }

  static setInt(String key, int value) async {
    if (!_isInitialized) return;
    try {
      await _prefs.setInt(key, value);
    } catch (e) {
      log('Error setting int preference $key: $e');
    }
  }

  static getInt(String key) {
    if (!_isInitialized) return 0;
    try {
      return _prefs.getInt(key) ?? 0;
    } catch (e) {
      log('Error getting int preference $key: $e');
      return 0;
    }
  }
}
