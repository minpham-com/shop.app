import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_object.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency extends BaseObject {
  Currency({
    required this.code,
    required this.name,
    required this.symbol,
    required this.symbolNative,
    required this.includesTax,
  });

  String code;
  String name;
  String symbol;

  @JsonKey(name: 'symbol_native')
  String symbolNative;

  @JsonKey(name: 'includes_tax')
  bool includesTax;

  @override
  String getName() {
    return 'currencies';
  }

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
