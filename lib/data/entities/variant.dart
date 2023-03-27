import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/inventory_item.dart';
import 'package:store/data/entities/price.dart';
import 'package:store/data/entities/product.dart';
import 'package:store/data/entities/tax_rate.dart';
import 'package:store/data/entities/value.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant extends BaseEntity {
  Variant(
      {required this.id,
      required this.title,
      required this.allowBackOrder,
      required super.createdAt,
      required super.updatedAt,
      required this.inventoryQuantity,
      required this.manageInventory,
      required this.productId,
      required this.originalPrice,
      required this.calculatedPrice,
      required this.originalPriceInclTax,
      required this.calculatedPriceInclTax,
      required this.originalTax,
      required this.calculatedTax,
      required this.prices,
      required this.options,
      required this.inventoryItems,
      required this.taxRates,
      super.deletedAt,
      this.ean,
      this.height,
      this.hsCode,
      this.barCode,
      this.length,
      this.material,
      this.metaData,
      this.midCode,
      this.originCountry,
      this.sku,
      this.upc,
      this.weight,
      this.width,
      this.product,
      this.variantRank});

  String id;
  String title;

  @JsonKey(name: 'allow_backorder')
  bool allowBackOrder;

  @JsonKey(name: 'inventory_quantity')
  int inventoryQuantity;

  @JsonKey(name: 'manage_inventory')
  bool manageInventory;

  @JsonKey(name: 'product_id')
  String productId;

  @JsonKey(name: 'original_price')
  double? originalPrice;

  @JsonKey(name: 'calculated_price')
  double? calculatedPrice;

  @JsonKey(name: 'original_price_incl_tax')
  double? originalPriceInclTax;

  @JsonKey(name: 'calculated_price_incl_tax')
  double? calculatedPriceInclTax;

  @JsonKey(name: 'original_tax')
  double? originalTax;

  @JsonKey(name: 'calculated_tax')
  double? calculatedTax;

  List<Price>? prices;
  List<Value>? options;

  @JsonKey(name: 'inventory_items')
  List<InventoryItem>? inventoryItems;

  @JsonKey(name: 'tax_rates')
  List<TaxRate>? taxRates;

  String? ean;
  double? height;

  @JsonKey(name: 'hs_code')
  String? hsCode;

  @JsonKey(name: 'barcode')
  String? barCode;

  double? length;

  String? material;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @JsonKey(name: 'mid_code')
  String? midCode;

  @JsonKey(name: 'origin_country')
  String? originCountry;

  String? sku;
  String? upc;
  double? weight;
  double? width;
  Product? product;

  @JsonKey(name: 'variant_rank')
  double? variantRank;

  @override
  String getName() {
    return 'variants';
  }

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}
