import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static SharedPreferences? _instance;
  static SharedPreferences? instance;
  static Future<void> init() async {
    _instance ??= await SharedPreferences.getInstance();
    instance = _instance;
  }
}
