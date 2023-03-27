import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/variant.dart';

part 'inventory_item.g.dart';

@JsonSerializable()
class InventoryItem extends BaseEntity {
  InventoryItem(
      {required this.id,
      required this.inventoryItemId,
      required this.requiredQuantity,
      required this.variantId,
      required this.variant,
      required super.createdAt,
      required super.updatedAt,
      this.metaData,
      super.deletedAt});

  String id;

  @JsonKey(name: 'inventory_item_id')
  String inventoryItemId;

  @JsonKey(name: 'required_quantity')
  int requiredQuantity;

  @JsonKey(name: 'variant_id')
  String variantId;

  Variant variant;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @override
  String getName() {
    return 'inventory_items';
  }

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}
