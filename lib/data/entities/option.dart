import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/product.dart';
import 'package:store/data/entities/value.dart';

part 'option.g.dart';

@JsonSerializable()
class Option extends BaseEntity {
  Option(
      {required this.id,
      required this.title,
      required this.values,
      required this.productId,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.metaData,
      this.product});

  String title;

  List<Value> values;

  String id;

  @JsonKey(name: 'product_id')
  String productId;

  @JsonKey(name: 'metadata')
  Object? metaData;

  Product? product;

  @override
  String getName() {
    return 'options';
  }

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
