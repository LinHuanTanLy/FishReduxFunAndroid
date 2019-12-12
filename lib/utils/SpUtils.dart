import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  static Future<bool> putStringList(String key, var str) async {
    print('the str is $str');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, str);
  }

  static Future<List<String>> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }
}
