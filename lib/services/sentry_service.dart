import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:store/env/env.dart';
import 'package:store/services/base_service.dart';

class SentryService extends BaseService {
  static Future<void> initialize() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = Env.sentryDsn;
      },
    );
  }
}
