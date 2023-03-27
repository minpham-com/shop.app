import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/product.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection extends BaseEntity {
  Collection(
      {required this.id,
      required this.handle,
      required this.title,
      required this.products,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.metaData});

  String id;
  String handle;
  String title;

  List<Product>? products;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @override
  String getName() {
    return 'collections';
  }

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
