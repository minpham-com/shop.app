import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/option.dart';
import 'package:store/data/entities/variant.dart';

part 'value.g.dart';

@JsonSerializable()
class Value extends BaseEntity {
  Value(
      {required this.id,
      required this.value,
      required this.optionId,
      required this.variantId,
      required super.createdAt,
      required super.updatedAt,
      this.metaData,
      super.deletedAt,
      this.option,
      this.variant});

  String id;

  String value;

  @JsonKey(name: 'option_id')
  String optionId;

  @JsonKey(name: 'variant_id')
  String variantId;

  @JsonKey(name: 'metadata')
  Object? metaData;

  Option? option;

  Variant? variant;

  @override
  String getName() {
    return 'values';
  }

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

  Map<String, dynamic> toJson() => _$ValueToJson(this);
}
