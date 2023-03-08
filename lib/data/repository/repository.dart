import 'dart:async';

import 'package:store/services/locator_service.dart';
import 'package:store/services/shared_preference_helper.dart';

class Repository {
  final String _endpoint;
  // shared pref object
  final SharedPreferenceHelper _prefs = getIt<SharedPreferenceHelper>();

  // constructor
  Repository(this._endpoint);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }

  Future<void> saveIsLoggedIn({required bool value}) =>
      _prefs.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _prefs.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark({required bool value}) =>
      _prefs.changeBrightnessToDark(value);

  bool get isDarkMode => _prefs.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) => _prefs.changeLanguage(value);

  String? get currentLanguage => _prefs.currentLanguage;

  String get endpoint => _endpoint;
}
