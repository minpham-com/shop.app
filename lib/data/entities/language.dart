import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language {
  /// the country code (IT,AF..)
  String? code;

  /// the locale (en, es, da)
  String? locale;

  /// the full name of language (English, Danish..)
  String? language;

  /// map of keys used based on industry type (service worker, route etc)
  Map<String, String>? dictionary;

  Language({this.code, this.locale, this.language, this.dictionary});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
