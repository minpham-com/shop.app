import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/services/base_service.dart';

class BoxService extends BaseService {
  static final BoxService _instance = BoxService._();
  // constructor
  BoxService._();

  static BoxService getInstance() {
    return _instance;
  }

  Box<T> getStore<T>(String name) {
    return Hive.box<T>(name);
  }
}
