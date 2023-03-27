import 'dart:async';
import 'package:store/services/shared_preference_service.dart';

class Repository {
  final String _endpoint;
  // shared pref object
  final SharedPreferenceService _service =
      SharedPreferenceService.getInstance();
  // constructor
  Repository(this._endpoint);
  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }

  Future<void> saveIsLoggedIn({required bool value}) =>
      _service.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _service.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark({required bool value}) =>
      _service.changeBrightnessToDark(value);

  Future<bool> get isDarkMode => _service.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) => _service.changeLanguage(value);

  Future<String?> get currentLanguage => _service.currentLanguage;

  String get endpoint => _endpoint;
}
