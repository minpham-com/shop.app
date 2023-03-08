import 'package:equatable/equatable.dart';

abstract class ErrEvent extends Equatable {
  // ignore: unused_field
  final int _type;
  // ignore: unused_field
  final String _message;

  // ignore: non_constant_identifier_names
  static int NULL = 0;
  // ignore: non_constant_identifier_names
  static int DEBUG = 1;
  // ignore: non_constant_identifier_names
  static int INFO = 2;
  // ignore: non_constant_identifier_names
  static int NOTICE = 3;
  // ignore: non_constant_identifier_names
  static int WARNING = 4;
  // ignore: non_constant_identifier_names
  static int ERROR = 5;
  // ignore: non_constant_identifier_names
  static int CRITICAL = 6;
  // ignore: non_constant_identifier_names
  static int ALERT = 7;
  // ignore: non_constant_identifier_names
  static int EMERGENCY = 8;

  const ErrEvent(this._type, this._message);

  @override
  List<Object?> get props => [_type, _message];

  int get type => _type;
  String get message => _message;
}

class NullEvent extends ErrEvent {
  NullEvent() : super(ErrEvent.NULL, "");
}

class DebugEvent extends ErrEvent {
  DebugEvent(String message) : super(ErrEvent.DEBUG, message);
}

class InfoEvent extends ErrEvent {
  InfoEvent(String message) : super(ErrEvent.INFO, message);
}

class NoticeEvent extends ErrEvent {
  NoticeEvent(String message) : super(ErrEvent.NOTICE, message);
}

class WarningEvent extends ErrEvent {
  WarningEvent(String message) : super(ErrEvent.WARNING, message);
}

class ErrorEvent extends ErrEvent {
  ErrorEvent(String message) : super(ErrEvent.ERROR, message);
}

class CriticalEvent extends ErrEvent {
  CriticalEvent(String message) : super(ErrEvent.CRITICAL, message);
}

class AlertEvent extends ErrEvent {
  AlertEvent(String message) : super(ErrEvent.ALERT, message);
}

class EmergencyEvent extends ErrEvent {
  EmergencyEvent(String message) : super(ErrEvent.EMERGENCY, message);
}
