import 'package:flutter/services.dart';
import 'package:store/services/base_service.dart';

class OrientationService extends BaseService {
  static Future<void> initialize() async {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}
