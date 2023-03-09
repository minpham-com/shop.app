import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/services/base_service.dart';
//import 'package:store/services/firebase_service.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/services/orientation_service.dart';
import 'package:store/services/sentry_service.dart';

class AppService extends BaseService {
  static Future<void> initialize() async {
    await OrientationService.initialize();
    await LocatorService.initialize();
    await Hive.initFlutter();
    //await FirebaseService.initialize();
    await SentryService.initialize();
    GoogleFonts.config.allowRuntimeFetching = false;
  }
}
