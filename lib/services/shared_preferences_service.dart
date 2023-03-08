// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/base_service.dart';

class SharedPreferencesService extends BaseService {
  static Future<SharedPreferences> getInstance() {
    return SharedPreferences.getInstance();
  }
}
