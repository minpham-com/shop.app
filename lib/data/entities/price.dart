import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/currency.dart';
import 'package:store/data/entities/region.dart';
import 'package:store/data/entities/variant.dart';

part 'price.g.dart';

@JsonSerializable()
class Price extends BaseEntity {
  Price(
      {required this.id,
      required this.currencyCode,
      required this.amount,
      required this.currency,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.maxQuantity,
      this.minQuantity,
      this.priceListId,
      this.regionId,
      this.variantId,
      this.priceList,
      this.variant,
      this.region});

  String id;

  @JsonKey(name: 'currency_code')
  String currencyCode;

  int amount;

  Currency? currency;

  @JsonKey(name: 'max_quantity')
  int? maxQuantity;

  @JsonKey(name: 'min_quantity')
  int? minQuantity;

  @JsonKey(name: 'price_list_id')
  String? priceListId;

  @JsonKey(name: 'region_id')
  String? regionId;

  @JsonKey(name: 'variant_id')
  String? variantId;

  @JsonKey(name: 'price_list')
  Object? priceList;

  Variant? variant;
  Region? region;

  @override
  String getName() {
    return 'prices';
  }

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
