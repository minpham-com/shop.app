import 'package:store/business/bloc/error/error_event.dart';

class ErrorState<T extends ErrEvent> {
  // ignore: unused_field
  final String _message;
  // ignore: unused_field
  final T _type;
  // ignore: unused_field
  final int _delay = ErrorState.DELAY_DEFAULT;

  // ignore: non_constant_identifier_names
  static int DELAY_DEFAULT = 200;

  ErrorState(this._message, this._type);
}
