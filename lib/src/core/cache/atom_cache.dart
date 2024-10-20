import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AtomCache {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> saveJsonData(
      {required String key, required dynamic value}) async {
    return await sharedPreferences!.setString(key, json.encode(value));
  }

  static dynamic getJsonData({required String key}) {
    dynamic value = sharedPreferences!.get(key);
    return value != null ? json.decode(value) : null;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
