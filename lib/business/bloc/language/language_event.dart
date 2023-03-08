import 'package:equatable/equatable.dart';

class LanguageEvent extends Equatable {
  // ignore: unused_field
  final String _language;

  // ignore: avoid_positional_boolean_parameters
  const LanguageEvent(this._language);

  @override
  List<Object?> get props => [_language];

  String get language => _language;
}
