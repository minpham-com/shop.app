import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/category.dart';
import 'package:store/data/entities/collection.dart';
import 'package:store/data/entities/image.dart';
import 'package:store/data/entities/option.dart';
import 'package:store/data/entities/product_type.dart';
import 'package:store/data/entities/profile.dart';
import 'package:store/data/entities/tag.dart';
import 'package:store/data/entities/variant.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseEntity {
  String id;

  String title;

  String? description;

  String? thumbnail;

  List<Variant>? variants;

  List<Option>? options;

  List<Image>? images;

  @JsonKey(name: 'collection_id')
  String? collectionId;

  bool discountable;

  @JsonKey(name: 'external_id')
  String? externalId;

  String? handle;

  double? height;

  @JsonKey(name: 'hs_code')
  String? hsCode;

  @JsonKey(name: 'is_giftcard')
  bool isGiftCard;

  double? length;

  String? material;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @JsonKey(name: 'mid_code')
  String? midCode;

  @JsonKey(name: 'origin_country')
  String? originCountry;

  @JsonKey(name: 'profile_id')
  String profileId;

  String status;

  @JsonKey(name: 'subtitle')
  String? subTitle;

  @JsonKey(name: 'type_id')
  String? typeId;

  double? weight;

  double? width;

  List<Category>? categories;

  Profile? profile;

  List<Tag>? tags;

  Collection? collection;

  ProductType? type;

  Product(
      {required this.id,
      required this.title,
      required this.discountable,
      required this.isGiftCard,
      required this.profileId,
      required this.profile,
      required this.status,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.variants,
      this.options,
      this.images,
      this.categories,
      this.tags,
      this.collection,
      this.type,
      this.description,
      this.thumbnail,
      this.collectionId,
      this.externalId,
      this.handle,
      this.height,
      this.hsCode,
      this.length,
      this.material,
      this.metaData,
      this.midCode,
      this.originCountry,
      this.subTitle,
      this.typeId,
      this.weight,
      this.width});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String getName() {
    return 'products';
  }
}
