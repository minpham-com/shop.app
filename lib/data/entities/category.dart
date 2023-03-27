import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/product.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends BaseEntity {
  Category(
      {required this.id,
      required this.handle,
      required this.name,
      required this.isActive,
      required this.isInternal,
      required this.rank,
      required this.products,
      required this.children,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.parent});

  String id;
  String handle;
  String name;
  @JsonKey(name: 'is_active')
  bool isActive;

  @JsonKey(name: 'is_internal')
  bool isInternal;
  int rank;

  String? mpath;

  @JsonKey(name: 'parent_category_id')
  String? parentCategoryId;

  List<Product> products;
  List<Category> children;

  @JsonKey(name: 'parent_category')
  Category? parent;

  @override
  String getName() {
    return 'categories';
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
