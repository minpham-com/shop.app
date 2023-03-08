import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:store/di/firebase.dart';
import 'package:store/di/get_it.dart';
import 'package:store/env/env.dart';
import 'package:store/ui/screens/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runZonedGuarded(() async {
    await setPreferredOrientations();
    await setupGetIt();
    await setupFirebase();
    await initSentry();
    GoogleFonts.config.allowRuntimeFetching = false;
    runApp(MyApp());
  }, (error, stack) async {
    await Sentry.captureException(error, stackTrace: stack);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

Future<void> initSentry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = Env.sentryDsn;
    },
  );
}
