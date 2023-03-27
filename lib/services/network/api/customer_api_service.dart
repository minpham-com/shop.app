import 'package:dio/dio.dart';
import 'package:store/extensions/list.dart';
import 'package:store/services/network/api/base_api_service.dart';

class CustomerApiService extends BaseApiService {
  static final CustomerApiService _instance = CustomerApiService._();
  // constructor
  CustomerApiService._();

  static CustomerApiService getInstance() {
    return _instance;
  }

  Future<Response<dynamic>> create(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      String? phone}) {
    return client.post<dynamic>('/store/customers',
        queryParameters: <String, dynamic>{
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'phone': phone,
        }.removeNulls());
  }

  Future<Response<dynamic>> me() {
    return client.get<dynamic>('/store/customers/me',
        queryParameters: <String, dynamic>{});
  }

  Future<Response<dynamic>> update(
      {String? firstName,
      String? lastName,
      String? password,
      String? phone,
      String? email}) {
    //TODO: billing_address, metadata
    return client.post<dynamic>('/store/customers/me',
        queryParameters: <String, dynamic>{
          'first_Name': firstName,
          'last_Name': lastName,
          'password': password,
          'phone': phone,
          'email': email,
        }.removeNulls());
  }

  //TODO: add shipping address, update shipping address,
  Future<Response<dynamic>> orders(
      {String? q,
      String? id,
      List<String>? status,
      List<String>? fulfillmentStatus,
      List<String>? paymentStatus,
      String? displayId,
      String? cartId,
      String? email,
      String? regionId,
      String? currencyCode,
      String? taxRate,
      //TODO: crreated_at, updated_at, canceled_at
      int? limit,
      int? offset,
      String? fields,
      String? expand}) {
    return client.get<dynamic>('/store/customers/me/orders',
        queryParameters: <String, dynamic>{
          'q': q,
          'id': id,
          'status': status,
          'fulfillment_status': fulfillmentStatus,
          'payment_status': paymentStatus,
          'display_id': displayId,
          'cart_id': cartId,
          'email': email,
          'region_id': regionId,
          'currency_code': currencyCode,
          'tax_rate': taxRate,
          'limit': limit,
          'offset': offset,
          'fields': fields,
          'expand': expand
        }.removeNulls());
  }

  Future<Response<dynamic>> deleteAddress(String id) {
    return client.delete<dynamic>('/store/customers/me/addresses/$id',
        queryParameters: <String, dynamic>{});
  }

  Future<Response<dynamic>> paymentMethods() {
    return client.get<dynamic>('/store/customers/me/payment-methods',
        queryParameters: <String, dynamic>{});
  }

  Future<Response<dynamic>> resetPassword(
      String email, String password, String token) {
    return client.post<dynamic>('/store/customers/password-reset',
        queryParameters: <String, dynamic>{
          'email': email,
          'password': password,
          'token': token
        }.removeNulls());
  }

  Future<Response<dynamic>> requestResetPassword(String email) {
    return client.post<dynamic>('/store/customers/password-token',
        queryParameters: <String, dynamic>{'email': email});
  }
}
