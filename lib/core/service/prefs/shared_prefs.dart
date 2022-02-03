import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String firstRunKey = 'firstRun';
  static const String cityKey = 'woeid';

  static Future<bool> setCityValue(int woeid) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setInt(cityKey, woeid);
  }

  static Future<int?> getCityValue(String cityKey) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getInt(cityKey);
  }

  static Future<bool> setFirstRun(bool firstRun) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setBool(firstRunKey, firstRun);
  }

  static Future<bool> getFirstRunValue() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.containsKey(firstRunKey);
  }
}
