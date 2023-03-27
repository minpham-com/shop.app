import 'package:dio/dio.dart';
import 'package:store/env/env.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/log_service.dart';
import 'package:store/services/shared_preference_service.dart';

class HttpService extends BaseService {
  static final HttpService _instance = HttpService._();
  // constructor
  HttpService._() {
    _client = getDefaultClient();
  }

  static HttpService getInstance() {
    return _instance;
  }

  // dio instance
  late Dio _client;
  static const String TAG = "HttpService";
  final LogService _log = LogService.getInstance();
  final SharedPreferenceService _service =
      SharedPreferenceService.getInstance();
  // injecting dio instance
  Dio setClient(Dio client) {
    _client = client;
    return client;
  }

  Dio setOptions(BaseOptions options) {
    _client.options = options;
    return _client;
  }

  Dio getDefaultClient() {
    final String apiUri = Env.apiUri;
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
        final String? token = await _service.accessToken;

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
    final String? refreshToken = await _service.refreshToken;

    if (refreshToken != null) {
      try {
        final Response response = await _client.post<dynamic>(
            "/oauth/refresh_token",
            data: {"refresh_token": refreshToken});
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final String accessToken = data['access_token'] as String;
        final String newRefreshToken = data['refresh_token'] as String;
        await _service.saveAccessToken(accessToken);
        await _service.saveRefreshToken(newRefreshToken);
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
  Future<Response<T>> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _client.get<T>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      _log.e("$TAG:get", [e]);
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> post<T>(
    String uri, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _client.post<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      _log.e("$TAG:post", [e]);
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response<T>> put<T>(
    String uri, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _client.put<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      _log.e("$TAG:put", [e]);
      rethrow;
    }
  }

  // Patch:-----------------------------------------------------------------------
  Future<Response<T>> patch<T>(
    String uri, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _client.patch<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      _log.e("$TAG:put", [e]);
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response<T>> delete<T>(
    String uri, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _client.delete<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      _log.e("$TAG:delete", [e]);
      rethrow;
    }
  }
}
