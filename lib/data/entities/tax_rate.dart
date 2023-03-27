import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_object.dart';

part 'tax_rate.g.dart';

@JsonSerializable()
class TaxRate extends BaseObject {
  TaxRate({
    required this.rate,
    required this.name,
    required this.code,
  });

  double rate;
  String name;
  String code;

  @override
  String getName() {
    return 'tax_rates';
  }

  factory TaxRate.fromJson(Map<String, dynamic> json) =>
      _$TaxRateFromJson(json);

  Map<String, dynamic> toJson() => _$TaxRateToJson(this);
}
