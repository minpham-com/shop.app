import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/constants/preferences.dart';

class SharedPreferenceService extends BaseService {
  static final SharedPreferenceService _instance = SharedPreferenceService._();

  // constructor
  SharedPreferenceService._();

  static SharedPreferenceService getInstance() {
    return _instance;
  }

  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  Future<String?> get accessToken async {
    return getString(Preferences.access_token);
  }

  Future<bool> saveAccessToken(String accessToken) async {
    return setString(Preferences.access_token, accessToken);
  }

  Future<bool> removeAuthToken() async {
    return remove(Preferences.access_token);
  }

  Future<String?> get refreshToken async {
    return getString(Preferences.refresh_token);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    return setString(Preferences.refresh_token, refreshToken);
  }

  Future<bool> removeRefreshToken() async {
    return remove(Preferences.refresh_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return await getBool(Preferences.is_logged_in) ?? false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> saveIsLoggedIn(bool value) async {
    return setBool(key: Preferences.is_logged_in, value: value);
  }

  // Theme:------------------------------------------------------
  Future<bool> get isDarkMode async {
    return await getBool(Preferences.is_dark_mode) ?? false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> changeBrightnessToDark(bool value) async {
    return setBool(key: Preferences.is_dark_mode, value: value);
  }

  // Language:---------------------------------------------------
  Future<String?> get currentLanguage async {
    return getString(Preferences.current_language);
  }

  Future<bool> changeLanguage(String language) async {
    return setString(Preferences.current_language, language);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future<bool?> getBool(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  Future<int?> getInt(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  Future<double?> getDouble(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(key);
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

  Future<bool> setBool({required String key, required bool value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setDouble(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setStringList(key, value);
  }

  Future<bool> remove(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
