import 'package:shared_preferences/shared_preferences.dart';
import '../../config/shared_preferences_singleton.dart';

class AppStorage {
  static SharedPreferences instance = SharedPreferencesSingleton.instance!;
  //Keys
  static const String _token = "token";
  static const String _userId = "user_id";
  static const String _userName = "user_name";
  static const String _userPhone = "user_phone";
  static const String _userAddress = "user_address";
  static const String _paymentPhone = "payment_phone";

  //Token
  static Future<bool> setToken(String token) async =>
      await instance.setString(_token, token);
  static String get getToken => instance.getString(_token) ?? "";

  static Future<bool> setUserId(int userId) async =>
      await instance.setInt(_userId, userId);
  static int? get getUserId => instance.getInt(_userId);

  static Future<bool> setUsername(String name) async =>
      await instance.setString(_userName, name);
  static String? get getUsername => instance.getString(_userName);

  static Future<bool> setPhone(String phone) async =>
      await instance.setString(_userPhone, phone);
  static String? get getPhone => instance.getString(_userPhone);

  static Future<bool> setAddress(String address) async =>
      await instance.setString(_userAddress, address);
  static String? get getAddress => instance.getString(_userAddress);

  static Future<bool> setPaymentPhone(String phone) async =>
      await instance.setString(_paymentPhone, phone);
  static String? get getPaymentPhone => instance.getString(_paymentPhone);
}
