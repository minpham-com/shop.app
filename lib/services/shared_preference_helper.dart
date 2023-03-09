import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/constants/preferences.dart';

class SharedPreferenceHelper extends BaseService {
  static final SharedPreferenceHelper _instance = SharedPreferenceHelper._();

  // constructor
  SharedPreferenceHelper._();

  static SharedPreferenceHelper getInstance() {
    return _instance;
  }

  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  Future<String?> get accessToken async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Preferences.access_token);
  }

  Future<bool> saveAccessToken(String accessToken) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(Preferences.access_token, accessToken);
  }

  Future<bool> removeAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(Preferences.access_token);
  }

  Future<String?> get refreshToken async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Preferences.refresh_token);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(Preferences.refresh_token, refreshToken);
  }

  Future<bool> removeRefreshToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(Preferences.refresh_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(Preferences.is_logged_in) ?? false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> saveIsLoggedIn(bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(Preferences.is_logged_in, value);
  }

  // Theme:------------------------------------------------------
  Future<bool> get isDarkMode async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(Preferences.is_dark_mode) ?? false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> changeBrightnessToDark(bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  Future<String?> get currentLanguage async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Preferences.current_language);
  }

  Future<bool> changeLanguage(String language) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(Preferences.current_language, language);
  }
}
