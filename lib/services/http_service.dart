import 'package:dio/dio.dart';
import 'package:store/env/env.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/log_service.dart';
import 'package:store/services/shared_preference_helper.dart';

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
  late final Dio _client;
  static const String TAG = "HttpService";
  final LogService _log = LogService.getInstance();
  final SharedPreferenceHelper _helper = SharedPreferenceHelper.getInstance();
  // injecting dio instance
  Dio setClient(Dio client) {
    _client = client;
    return client;
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
        final String? token = await _helper.accessToken;

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
    final String? refreshToken = await _helper.refreshToken;

    if (refreshToken != null) {
      try {
        final Response response = await _client.post<Response>(
            "/oauth/refresh_token",
            data: {"refresh_token": refreshToken});
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final String accessToken = data['access_token'] as String;
        final String newRefreshToken = data['refresh_token'] as String;
        await _helper.saveAccessToken(accessToken);
        await _helper.saveRefreshToken(newRefreshToken);
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
  Future<Response> get(
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
      return response;
    } catch (e) {
      _log.e("$TAG:get", [e]);
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
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
      return response;
    } catch (e) {
      _log.e("$TAG:post", [e]);
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
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
      return response;
    } catch (e) {
      _log.e("$TAG:put", [e]);
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response> delete(
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
      return response;
    } catch (e) {
      _log.e("$TAG:delete", [e]);
      rethrow;
    }
  }
}
