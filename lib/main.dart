import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:store/services/app_service.dart';
import 'package:store/ui/screens/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runZonedGuarded(() async {
    await AppService.initialize();
    runApp(MyApp());
  }, (error, stack) async {
    print(stack);
    await Sentry.captureException(error, stackTrace: stack);
  });
}
