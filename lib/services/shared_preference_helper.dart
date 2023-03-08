import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/constants/preferences.dart';
import 'package:store/services/locator_service.dart';

class SharedPreferenceHelper extends BaseService {
  // shared pref instance
  final SharedPreferences _pref = getIt<SharedPreferences>();

  // constructor
  SharedPreferenceHelper();

  // General Methods: ----------------------------------------------------------
  Future<String?> get accessToken async {
    return _pref.getString(Preferences.access_token);
  }

  Future<bool> saveAccessToken(String accessToken) async {
    return _pref.setString(Preferences.access_token, accessToken);
  }

  Future<bool> removeAuthToken() async {
    return _pref.remove(Preferences.access_token);
  }

  Future<String?> get refreshToken async {
    return _pref.getString(Preferences.refresh_token);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    return _pref.setString(Preferences.refresh_token, refreshToken);
  }

  Future<bool> removeRefreshToken() async {
    return _pref.remove(Preferences.refresh_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _pref.getBool(Preferences.is_logged_in) ?? false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> saveIsLoggedIn(bool value) async {
    return _pref.setBool(Preferences.is_logged_in, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _pref.getBool(Preferences.is_dark_mode) ?? false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeBrightnessToDark(bool value) {
    return _pref.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _pref.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _pref.setString(Preferences.current_language, language);
  }
}
