import 'dart:async';
import 'package:store/services/shared_preference_helper.dart';

class Repository {
  final String _endpoint;
  // shared pref object
  final SharedPreferenceHelper _helper = SharedPreferenceHelper.getInstance();
  // constructor
  Repository(this._endpoint);
  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }

  Future<void> saveIsLoggedIn({required bool value}) =>
      _helper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _helper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark({required bool value}) =>
      _helper.changeBrightnessToDark(value);

  Future<bool> get isDarkMode => _helper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) => _helper.changeLanguage(value);

  Future<String?> get currentLanguage => _helper.currentLanguage;

  String get endpoint => _endpoint;
}
