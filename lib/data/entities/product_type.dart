import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';

part 'product_type.g.dart';

@JsonSerializable()
class ProductType extends BaseEntity {
  ProductType(
      {required this.id,
      required this.value,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.metaData});

  String id;
  String value;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @override
  String getName() {
    return 'product_types';
  }

  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}
