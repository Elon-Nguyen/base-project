import 'dart:async';
import 'dart:developer';

import 'package:base_project/core/constants/app_url.dart';
import 'package:base_project/core/data/datasources/secure_data_source/secure_storage_impl.dart';
import 'package:base_project/core/errors/bad_response.dart';
import 'package:base_project/core/errors/network_exception.dart';
import 'package:base_project/core/errors/request_cancelled.dart';
import 'package:base_project/core/errors/server_timeout.dart';
import 'package:base_project/core/errors/unknown_exception.dart';
import 'package:dio/dio.dart';

// Token model to handle both access and refresh tokens
class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({required this.accessToken, required this.refreshToken});
}

// Token refresh callback type
typedef RefreshTokenCallback = Future<TokenPair> Function();

class ApiService {
  // Singleton instance
  static final ApiService _instance = ApiService._internal();

  // Factory constructor to return the singleton instance
  factory ApiService() => _instance;

  // Private constructor for internal use
  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppUrl.url,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(LoggingInterceptor());
  }

  // Dio instance
  late final Dio _dio;

  // Add an auth interceptor with refresh capability
  void addAuthInterceptor() {
    _dio.interceptors.add(AuthInterceptor(dio: _dio));
  }

  // Generic GET method
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? converter,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );

      if (converter != null) {
        return converter(response.data);
      }
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Generic POST method
  Future<T> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? converter,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (converter != null) {
        return converter(response.data);
      }
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // PUT method
  Future<T> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? converter,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (converter != null) {
        return converter(response.data);
      }
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE method
  Future<T> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? converter,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (converter != null) {
        return converter(response.data);
      }
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // PATCH method
  Future<T> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? converter,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (converter != null) {
        return converter(response.data);
      }
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Error handling
  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ServerTimeOut();
        case DioExceptionType.badResponse:
          return ServerBadResponse();
        case DioExceptionType.cancel:
          return RequestCancelled();
        case DioExceptionType.connectionError:
          return NetworkException();
        case DioExceptionType.badCertificate:
          throw UnimplementedError();
        case DioExceptionType.unknown:
          return UnknownException();
      }
    }

    return UnknownException(error.toString());
  }
}

// LoggingInterceptor
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('=======================================');
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    log('PARAMS: ${options.queryParameters}');
    log('BODY: ${options.data}');
    log('=======================================');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('=======================================');
    log(
      '''RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}''',
    );
    log('DATA: ${response.data}');
    log('=======================================');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('=======================================');
    log(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    log('MESSAGE: ${err.message}');
    log('=======================================');
    return super.onError(err, handler);
  }
}

final SecureStorageImpl secureStorageImpl = SecureStorageImpl();

class AuthInterceptor extends Interceptor {
  final Dio dio;
  bool _isRefreshing = false;
  final _pendingRequests = <RequestOptions>[];

  AuthInterceptor({required this.dio});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await secureStorageImpl.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final newTokens = await _refreshToken(err.requestOptions);
      if (newTokens != null) {
        // Retry the failed request with the new token
        final retryResponse = await _retryRequest(
          err.requestOptions,
          newTokens.accessToken,
        );
        return handler.resolve(retryResponse);
      }
    }
    return super.onError(err, handler);
  }

  Future<TokenPair?> _refreshToken(RequestOptions failedRequest) async {
    if (!_isRefreshing) {
      _isRefreshing = true;
      try {
        final String? oldRefreshToken =
            await secureStorageImpl.readRefreshToken();

        if (oldRefreshToken != null) {
          //Logic get token and refresh token new
        }

        final TokenPair newTokens = TokenPair(
          accessToken: 'new access token',
          refreshToken: 'new refresh token',
        );

        //Save new token and refresh token
        await secureStorageImpl.writeAccessToken(newTokens.accessToken);
        await secureStorageImpl.writeRefreshToken(newTokens.refreshToken);

        // Retry all pending requests
        for (final request in _pendingRequests) {
          final response = await _retryRequest(request, newTokens.accessToken);
          (request.extra['completer'] as Completer<Response>?)?.complete(
            response,
          );
        }
        _pendingRequests.clear();
        _isRefreshing = false;
        return newTokens;
      } catch (e) {
        _isRefreshing = false;
        _pendingRequests.clear();
        log('Token refresh failed: $e');
        return null;
      }
    } else {
      // Wait for the ongoing refresh to complete
      final completer = Completer<Response<dynamic>>();
      failedRequest.extra['completer'] = completer;
      _pendingRequests.add(failedRequest);
      try {
        final _ = await completer.future;
        return null; // Request has been handled by the ongoing refresh
      } catch (e) {
        return null;
      }
    }
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions requestOptions,
    String newToken,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, 'Authorization': 'Bearer $newToken'},
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
