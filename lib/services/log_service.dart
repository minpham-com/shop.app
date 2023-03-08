import 'package:logger/logger.dart';
import 'package:store/services/base_service.dart';

class LogService extends BaseService {
  late final Logger _log;
  LogService() {
    _log = Logger();
  }

  Logger getLogger() {
    return _log;
  }

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.wtf(message, error, stackTrace);
  }
}
