import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/error/error_event.dart';
import 'package:store/business/bloc/product/product_event.dart';
import 'package:store/business/bloc/product/product_state.dart';
import 'package:store/data/models/product.dart';
import 'package:store/data/repository/product_repository.dart';
import 'package:store/services/locator_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // repository instance
  late final ProductRepository _repository = getIt<ProductRepository>();
  // store for handling errors
  final ErrorBloc errorBloc = getIt<ErrorBloc>();

  ProductBloc() : super(ProductState(true, false, []));

  List<Product>? get items => state.items;

  bool get success => state.success;

  bool get loading => state.loading;

  Future getItems() async {
    add(const ProductEvent(false, true, []));
    final future = _repository.getItems();

    future.then((items) {
      add(ProductEvent(true, false, items));
    }).catchError((Object error) {
      add(const ProductEvent(false, false, []));
      errorBloc.add(ErrorEvent(error.toString()));
    });
  }
}
