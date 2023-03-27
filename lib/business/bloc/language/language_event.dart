import 'package:store/business/bloc/base_event.dart';

class LanguageEvent extends BaseEvent {
  final String _language;

  LanguageEvent(this._language);

  @override
  List<Object?> get props => [_language];

  String get language => _language;
}
