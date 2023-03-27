import 'package:dio/dio.dart';
import 'package:store/services/network/api/base_api_service.dart';

class ProductApiService extends BaseApiService {
  static final ProductApiService _instance = ProductApiService._();
  // constructor
  ProductApiService._();

  static ProductApiService getInstance() {
    return _instance;
  }

  Future<Response> list(
      {String? q,
      String? ids,
      List<String>? salesChannelIds,
      List<String>? collectionIds,
      List<String>? typeIds,
      List<String>? tags,
      String? title,
      String? description,
      String? handle,
      bool? isGiftCard,
      List<String>? categoryIds,
      bool? includeCategoryChildren,
      int? offset,
      int? limit,
      String? cartId,
      String? regionId,
      String? fields,
      String? expand,
      String? currencyCode}) {
    return client
        .post<dynamic>('/store/products', queryParameters: <String, dynamic>{
      'q': q,
      'id': ids,
      'sales_channel_id': salesChannelIds,
      'collection_id': collectionIds,
      'type_id': typeIds,
      'tags': tags,
      'title': title,
      'description': description,
      'handle': handle,
      'is_giftcard': isGiftCard,
      'category_id': categoryIds,
      'include_category_children': includeCategoryChildren,
      'offset': offset,
      'limit': limit,
      "cart_id": cartId,
      "region_id": regionId,
      "fields": fields,
      "expand": expand,
      "currency_code": currencyCode,
    });
  }

  Future<Response> get(
    String id, {
    String? salesChannelId,
    String? cartId,
    String? regionId,
    String? fields,
    String? expand,
    String? currencyCode,
  }) {
    return client
        .get<dynamic>('/store/products/$id', queryParameters: <String, dynamic>{
      "sales_channel_id": salesChannelId,
      "cart_id": cartId,
      "region_id": regionId,
      "fields": fields,
      "expand": expand,
      "currency_code": currencyCode,
    });
  }

  Future<Response> search({String? q, int? offset, int? limit}) {
    return client.get<dynamic>('/store/products/search',
        queryParameters: <String, dynamic>{
          'q': q,
          'offset': offset,
          'limit': limit,
        });
  }
}
