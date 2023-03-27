import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/product.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends BaseEntity {
  Profile(
      {required this.id,
      required this.name,
      required this.type,
      required this.products,
      required this.shippingOptions,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.metaData});

  String id;
  String name;
  String type;
  List<Product> products;

  @JsonKey(name: 'shipping_options')
  List<Object> shippingOptions;

  @nullable
  @JsonKey(name: 'metadata')
  Object? metaData;

  @override
  String getName() {
    return 'profiles';
  }

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
