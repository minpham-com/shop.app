import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/base_bloc.dart';
import 'package:store/business/bloc/base_event.dart';
import 'package:store/business/bloc/product/product_event.dart';
import 'package:store/business/bloc/product/product_state.dart';
import 'package:store/data/entities/product.dart';
import 'package:store/data/entities/product_list.dart';
import 'package:store/services/log_service.dart';
import 'package:store/services/network/api/product_api_service.dart';

class ProductBloc extends BaseBloc<BaseEvent, ProductState> {
  static const String _tag = 'ProductBloc';

  final LogService _log = LogService.getInstance();

  final ProductApiService _service = ProductApiService.getInstance();

  ProductBloc() : super(ProductState.initial()) {
    on<ProductLoadingEvent>(_onLoading);
    on<ProductListEvent>(_onProductList);
  }

  Future<void> _onLoading(
      ProductLoadingEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(actionLoading: event.loading));
  }

  Future<void> _onProductList(
      ProductListEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(
        list: event.items,
        actionCount: event.count,
        actionOffset: event.offset,
        actionLimit: event.limit));
    _log.d(
      state,
    );
  }

  List<Product> get items => state.items;

  bool get success => state.success;

  bool get loading => state.loading;

  Future<dynamic> getItems() async {
    add(ProductLoadingEvent(loading: true));
    try {
      final Response<dynamic> response = await _service.list();
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      final List<Product> list = ProductList.fromJson(data).getItems();
      add(ProductListEvent(list, data['count'] as int, data['offset'] as int,
          data['limit'] as int));
    } catch (e, stackTrace) {
      _log.e(_tag, e, stackTrace);
    } finally {
      add(ProductLoadingEvent(loading: false));
    }
  }
}
