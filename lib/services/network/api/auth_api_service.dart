import 'package:dio/dio.dart';
import 'package:store/services/network/api/base_api_service.dart';

class AuthApiService extends BaseApiService {
  static final AuthApiService _instance = AuthApiService._();
  // constructor
  AuthApiService._();

  static AuthApiService getInstance() {
    return _instance;
  }

  Future<Response> login(String email, String password) {
    return client
        .post<dynamic>('/store/auth', data: {email: email, password: password});
  }

  Future<Response> logout() {
    return client.delete<dynamic>('/store/auth');
  }

  Future<Response> me() {
    return client.get<dynamic>('/store/auth');
  }

  Future<Response> emailExists(String email) {
    return client.get<dynamic>('/store/auth/$email');
  }
}
