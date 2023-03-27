import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/log_service.dart';

class BoxService extends BaseService {
  static final BoxService _instance = BoxService._();
  static const tag = 'BoxService';
  final LogService log = LogService.getInstance();
  // constructor
  BoxService._();

  static BoxService getInstance() {
    return _instance;
  }

  bool isOpen<T>(String name) {
    return Hive.isBoxOpen(name);
  }

  Future<void> openBox<T>(String name) async {
    if (!isOpen<T>(name)) {
      await Hive.openBox<T>(name);
    }
  }

  Future<Box<T>> getStore<T>(String name) async {
    log.d("$tag/$name");
    await openBox<T>(name);
    return Hive.box<T>(name);
  }
}
