/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient({
    required String baseUrl,
    Future<String?> Function()? tokenProvider,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Interceptor will inyect the Bearer Token dynamically in each request
    if (tokenProvider != null) {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            try {
              final token = await tokenProvider();
              if (token != null) {
                options.headers['Authorization'] = 'Bearer $token';
              }
            } catch (_) {
              // Token not available, pass the request without Bearer
            }
            return handler.next(options);
          },
        ),
      );
    }

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }
  }

  Future<void> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );

      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        throw handledError;
      }
    }
  }

  Future<void> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        throw handledError;
      }
    }
  }

  Future<void> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        throw handledError;
      }
    }
  }

  Future<void> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );

      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        throw handledError;
      }
    }
  }

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        return Exception('Server error [$statusCode]: $data');
      case DioExceptionType.cancel:
        return Exception('Request canceled.');
      case DioExceptionType.unknown:
      default:
        final statusCode = error.response?.statusCode;
        return Exception(
          'Unexpected network error: [$statusCode] ${error.message}',
        );
    }
  }
}
