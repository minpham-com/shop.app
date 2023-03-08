import 'package:equatable/equatable.dart';

class ThemeEvent extends Equatable {
  // ignore: unused_field
  final bool _isDark;

  // ignore: avoid_positional_boolean_parameters
  const ThemeEvent(this._isDark);

  @override
  List<Object?> get props => [_isDark];

  bool get isDark => _isDark;
}
