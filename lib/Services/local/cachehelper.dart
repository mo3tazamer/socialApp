import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedpreferences;

  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> savedata(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedpreferences?.setString(key, value);
    if (value is bool) return await sharedpreferences?.setBool(key, value);
    if (value is int) return await sharedpreferences?.setInt(key, value);
    return await sharedpreferences?.setDouble(key, value);
  }

  static dynamic getdata({
    required String key,
  }) {
    return sharedpreferences?.get(key);
  }

  static dynamic removedata({
    required String key,
  }) {
    return sharedpreferences?.remove(key);
  }
}
