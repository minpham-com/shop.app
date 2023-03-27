import 'package:store/business/bloc/base_state.dart';

class LanguageState extends BaseState {
  final String _language;

  LanguageState(this._language);

  String get language => _language;

  @override
  List<Object?> get props => [_language];
}
