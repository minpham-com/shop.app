import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/firebase_service.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/services/orientation_service.dart';
import 'package:store/services/sentry_service.dart';
import 'package:store/ui/screens/my_app.dart';

class AppService extends BaseService {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    return runZonedGuarded(() async {
      await OrientationService.initialize();
      await LocatorService.initialize();
      await FirebaseService.initialize();
      await SentryService.initialize();
      GoogleFonts.config.allowRuntimeFetching = false;
      runApp(MyApp());
    }, (error, stack) async {
      await Sentry.captureException(error, stackTrace: stack);
    });
  }
}
