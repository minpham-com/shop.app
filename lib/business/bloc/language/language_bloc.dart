import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/base_event.dart';
import 'package:store/business/bloc/language/language_event.dart';
import 'package:store/business/bloc/language/language_state.dart';
import 'package:store/data/entities/language.dart';

class LanguageBloc extends Bloc<BaseEvent, LanguageState> {
  // supported languages
  List<Language> supports = [
    Language(code: 'US', locale: 'en', language: 'English'),
    Language(code: 'VN', locale: 'vi', language: 'VietNam'),
  ];

  // constructor:---------------------------------------------------------------
  LanguageBloc() : super(LanguageState("vi"));

  String get locale => state.language;

  void changeLanguage(String value) {
    add(LanguageEvent(value));
  }

  String? getCode() {
    return supports[supports
            .indexWhere((language) => language.locale == state.language)]
        .code;
  }

  String? getLanguage() {
    return supports[supports
            .indexWhere((language) => language.locale == state.language)]
        .language;
  }

  dynamic dispose() {}
}
