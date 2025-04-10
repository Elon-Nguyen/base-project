import 'dart:developer';

import 'package:base_project/core/errors/bad_response.dart';
import 'package:base_project/core/errors/network_exception.dart';
import 'package:base_project/core/errors/request_cancelled.dart';
import 'package:base_project/core/errors/server_timeout.dart';
import 'package:base_project/core/errors/unknown_exception.dart';
import 'package:base_project/presentation/constants/app_url.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Factory constructor to create ApiService with default settings
  factory ApiService.create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppUrl.url,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return ApiService(dio);
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

  // Similarly, implement PUT, DELETE, PATCH etc.
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

// interceptors.dart
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    log('PARAMS: ${options.queryParameters}');
    log('BODY: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('''
RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}''');
    log('DATA: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    log('MESSAGE: ${err.message}');
    return super.onError(err, handler);
  }
}

class AuthInterceptor extends Interceptor {
  final String Function() getToken;

  AuthInterceptor(this.getToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}
