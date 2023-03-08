import 'package:store/data/models/product.dart';

class ProductState {
  // ignore: unused_field
  final bool _success;

  final bool _loading;

  final List<Product>? _items;
  // ignore: avoid_positional_boolean_parameters
  ProductState(this._success, this._loading, this._items);

  bool get success => _success;

  bool get loading => _loading;

  List<Product>? get items => _items;
}
