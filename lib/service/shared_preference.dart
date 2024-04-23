import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setAuthenticated(bool value) async {
    await _preferences.setBool('authenticated', value);
  }

  static bool isAuthenticated() {
    return _preferences.getBool('authenticated') ?? false;
  }

  static Future<void> saveUserInfo(String name, String email, String phoneNumber) async {
    await _preferences.setString('name', name);
    await _preferences.setString('email', email);
    await _preferences.setString('phoneNumber', phoneNumber);
  }

  static String getName() {
    return _preferences.getString('name') ?? '';
  }

  static String getEmail() {
    return _preferences.getString('email') ?? '';
  }

  static String getPhoneNumber() {
    return _preferences.getString('phoneNumber') ?? '';
  }
}
