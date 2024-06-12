import 'package:shared_preferences/shared_preferences.dart';
import '../../config/shared_preferences_singleton.dart';

class AppStorage {
  static SharedPreferences instance = SharedPreferencesSingleton.instance!;
  //Keys
  static const String _token = "token";
  static const String _name = "name";

  //Token
  static Future<bool> setToken(String token) async =>
      await instance.setString(_token, token);
  static String? get getToken => instance.getString(_token);

  //Name
  static Future<bool> setName(String name) async =>
      await instance.setString(_name, name);
  static String? get getName => instance.getString(_name);

  static Future<bool> get clear async => await instance.clear();
}
