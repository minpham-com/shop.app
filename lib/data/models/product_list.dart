import 'package:store/data/models/product.dart';

class ProductList {
  final List<Product>? items;

  ProductList({
    this.items,
  });

  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> items = <Product>[];
    items = json
        .map((dynamic item) => Product.fromMap(item as Map<String, dynamic>))
        .toList();

    return ProductList(
      items: items,
    );
  }
}
