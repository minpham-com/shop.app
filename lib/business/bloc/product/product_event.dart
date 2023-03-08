import 'package:equatable/equatable.dart';
import 'package:store/data/models/product.dart';

class ProductEvent extends Equatable {
  // ignore: unused_field
  final bool _success;

  // ignore: unused_field
  final bool _loading;

  // ignore: unused_field
  final List<Product>? _items;
  // ignore: avoid_positional_boolean_parameters
  const ProductEvent(this._success, this._loading, this._items);

  @override
  List<Object?> get props => [_success, _loading, _items];

  bool get success => _success;

  bool get loading => _loading;

  List<Product>? get items => _items;
}
