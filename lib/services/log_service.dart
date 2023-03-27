import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:store/services/base_service.dart';

class LogService extends BaseService {
  late final Logger _log = Logger();

  static final LogService _instance = LogService();
  // constructor
  LogService();

  static LogService getInstance() {
    return _instance;
  }

  Logger getLogger() {
    return _log;
  }

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.v(jsonEncode(message), error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.d(jsonEncode(message), error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.i(jsonEncode(message), error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.w(jsonEncode(message), error, stackTrace);
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.e(jsonEncode(message), error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.wtf(jsonEncode(message), error, stackTrace);
  }
}
