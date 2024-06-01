import 'package:shared_preferences/shared_preferences.dart';

class CachedNetwork {
  static late SharedPreferences sharedPref;

  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }
}
