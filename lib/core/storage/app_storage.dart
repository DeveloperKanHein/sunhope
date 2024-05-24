import 'package:shared_preferences/shared_preferences.dart';
import '../../config/shared_preferences_singleton.dart';

class AppStorage {
  static SharedPreferences instance = SharedPreferencesSingleton.instance!;
  //Keys
  static const String _token = "token";

  //Token
  static Future<bool> setToken(String token) async =>
      await instance.setString(_token, token);

  static String? get getToken => instance.getString(_token);
}
