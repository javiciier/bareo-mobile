/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../app/configuration/environment.dart';
import '../../app/mixin/logger_mixin.dart';
import 'interceptors/request_logger_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class NetworkClient with LoggerMixin {
  late final Dio _dio;

  NetworkClient({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ENV.BASE_URL,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.addAll([TokenInterceptor, RequestLoggerInterceptor]);
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
