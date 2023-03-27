import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/product.dart';

part 'product_list.g.dart';

@JsonSerializable()
class ProductList {
  @JsonKey(name: 'products')
  final List<Product> items;

  ProductList({
    required this.items,
  });

  List<Product> getItems() => items;

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}
