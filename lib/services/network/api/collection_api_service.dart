import 'package:dio/dio.dart';
import 'package:store/services/network/api/base_api_service.dart';

class CollectionApiService extends BaseApiService {
  static final CollectionApiService _instance = CollectionApiService._();
  // constructor
  CollectionApiService._();

  static CollectionApiService getInstance() {
    return _instance;
  }

  Future<Response<dynamic>> list(int offset, int limit) {
    return client.post<dynamic>('/store/collections',
        data: {offset: offset, limit: limit});
  }

  Future<Response<dynamic>> get(String id) {
    return client.get<dynamic>('/store/collections/$id');
  }
}
