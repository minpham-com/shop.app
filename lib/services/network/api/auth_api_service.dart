import 'package:dio/dio.dart';
import 'package:store/services/network/api/base_api_service.dart';

class AuthApiService extends BaseApiService {
  static final AuthApiService _instance = AuthApiService._();
  // constructor
  AuthApiService._();

  static AuthApiService getInstance() {
    return _instance;
  }

  Future<Response<dynamic>> login(String email, String password) {
    return client.post<dynamic>('/store/auth',
        data: {'email': email, 'password': password});
  }

  Future<Response<dynamic>> logout() {
    return client.delete<dynamic>('/store/auth');
  }

  Future<Response<dynamic>> me() {
    return client.get<dynamic>('/store/auth');
  }

  Future<Response<dynamic>> emailExists(String email) {
    return client.get<dynamic>('/store/auth/$email');
  }
}
