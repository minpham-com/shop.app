import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:store/env/env_key.dart';
import 'package:store/services/firebase_service.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/services/shared_preference_helper.dart';

class HttpService {
  // dio instance
  late final Dio _client;
  static const String TAG = "HttpService";
  final Logger _log = getIt<Logger>();
  final FirebaseService _firebaseService = getIt<FirebaseService>();
  final SharedPreferenceHelper _pref = getIt<SharedPreferenceHelper>();
  // injecting dio instance
  HttpService(Dio? client) {
    client ??= getDefaultClient();
    _client = client;
  }

  Dio getDefaultClient() {
    final String apiUri = _firebaseService.getString(EnvKey.apiUri) as String;
    final BaseOptions options = BaseOptions(
        baseUrl: apiUri,
        connectTimeout: const Duration(seconds: 15000),
        receiveTimeout: const Duration(seconds: 30000),
        headers: <String, dynamic>{
          'Content-Type': 'application/json; charset=utf-8'
        });
    final Dio dio = Dio(options);

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));
    dio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // getting token
        final String? token = await _pref.accessToken;

        if (token != null) {
          options.headers.putIfAbsent('Authorization', () => token);
        }

        return handler.next(options);
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      }, onError: (DioError err, ErrorInterceptorHandler handler) async {
        if (err.response == null) {
          return;
        }
        if (err.response!.statusCode == 401) {
          final bool? res = await refreshToken();
          if (res != null && res) {
            await _retry(err.requestOptions);
          }
        }
        return handler.next(err);
      }),
    );

    return dio;
  }

  Dio getClient() {
    return _client;
  }

  Future<bool?> refreshToken() async {
    final String? refreshToken = await _pref.refreshToken;

    if (refreshToken != null) {
      try {
        final Response response = await _client.post<Response>(
            "/oauth/refresh_token",
            data: {"refresh_token": refreshToken});
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final String accessToken = data['access_token'] as String;
        final String newRefreshToken = data['refresh_token'] as String;
        await _pref.saveAccessToken(accessToken);
        await _pref.saveRefreshToken(newRefreshToken);
        return true;
      } catch (err) {
        _log.e("$TAG:refreshToken", [err]);
      }
    }

    return false;
  }

  /// For retrying request with new token
  ///
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _client.get<Response>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      _log.e("$TAG:get", [e]);
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _client.post<Response>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      _log.e("$TAG:post", [e]);
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _client.put<Response>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      _log.e("$TAG:put", [e]);
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _client.delete<Response>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      _log.e("$TAG:delete", [e]);
      rethrow;
    }
  }
}
