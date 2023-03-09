import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:store/objectbox.g.dart';
import 'package:store/services/base_service.dart';

class ObjectBoxService extends BaseService {
  static final ObjectBoxService _instance = ObjectBoxService._();
  // constructor
  ObjectBoxService._() {
    initialize();
  }

  static ObjectBoxService getInstance() {
    return _instance;
  }

  late Store _store;

  Future<void> initialize() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();

    _store = Store(
      getObjectBoxModel(),
      directory: path.join(directory.path, 'db'),
    );

    return;
  }

  Store get store => _store;
}
