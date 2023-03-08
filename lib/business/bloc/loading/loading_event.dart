import 'package:equatable/equatable.dart';

class LoadingEvent extends Equatable {
  // ignore: unused_field
  final bool _loading;

  // ignore: avoid_positional_boolean_parameters
  const LoadingEvent(this._loading);

  @override
  List<Object?> get props => [_loading];

  bool get loading => _loading;
}
