/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../app/configuration/environment.dart';
import '../../app/mixin/logger_mixin.dart';
import 'interceptors/request_logger_interceptor.dart';
import 'interceptors/request_traceability_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class NetworkClient with LoggerMixin {
  late final Dio _dio;
  final FirebaseTokenInterceptor tokenInterceptor;
  final RequestTraceabilityInterceptor requestTraceabilityInterceptor;

  NetworkClient({String? baseUrl, required this.tokenInterceptor, required this.requestTraceabilityInterceptor}) {
    // Configure timeouts for debugging mode
    final Duration? debuggingTimeout = kDebugMode ? null : const Duration(seconds: 15);
    final Locale locale = PlatformDispatcher.instance.locale;

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ENV.BASE_URL,
        connectTimeout: debuggingTimeout,
        receiveTimeout: debuggingTimeout,
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: {'accept': 'application/json', 'accept-Language': locale.languageCode},
      ),
    )..interceptors.addAll([tokenInterceptor, requestTraceabilityInterceptor, RequestLoggerInterceptor]);
  }

  Future<void> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(Map<String, Object?> data)? onSuccess,
    Function(Map<String, Object?> error)? onError,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters, options: options);

      if (onSuccess != null && response.data != null) {
        onSuccess(response.data as Map<String, Object?>);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        logger.severe('Unknown error for GET request', e);
        throw Exception(handledError['message'] ?? 'Unknown error for GET request');
      }
    }
  }

  Future<void> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(Map<String, Object?> data)? onSuccess,
    Function(Map<String, Object?> error)? onError,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data, queryParameters: queryParameters, options: options);

      if (onSuccess != null && response.data != null) {
        onSuccess(response.data as Map<String, Object?>);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        logger.severe('Unknown error for POST request', e);
        throw Exception(handledError['message'] ?? 'Unknown error for POST request');
      }
    }
  }

  Future<void> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(Map<String, Object?> data)? onSuccess,
    Function(Map<String, Object?> error)? onError,
  }) async {
    try {
      final response = await _dio.put(endpoint, data: data, queryParameters: queryParameters, options: options);

      if (onSuccess != null && response.data != null) {
        onSuccess(response.data as Map<String, Object?>);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        logger.severe('Unknown error for PUT request', e);
        throw Exception(handledError['message'] ?? 'Unknown error for PUT request');
      }
    }
  }

  Future<void> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(Map<String, Object?> data)? onSuccess,
    Function(Map<String, Object?> error)? onError,
  }) async {
    try {
      final response = await _dio.delete(endpoint, queryParameters: queryParameters, options: options);

      if (onSuccess != null && response.data != null) {
        onSuccess(response.data as Map<String, Object?>);
      }
    } on DioException catch (e) {
      final handledError = _handleDioError(e);
      if (onError != null) {
        onError(handledError);
      } else {
        logger.severe('Unknown error for DELETE request', e);
        throw Exception(handledError['message'] ?? 'Unknown error for DELETE request');
      }
    }
  }

  Map<String, Object?> _handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    final requestPath = error.requestOptions.path;
    final method = error.requestOptions.method;
    final response = error.response?.data;

    logger.severe('Error for request $method $requestPath [$statusCode]: ${error.message}');

    if (response is Map<String, Object?>) {
      return response;
    }

    String errorMessage;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Connection timeout.';
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request canceled.';
        break;
      case DioExceptionType.badResponse:
        errorMessage = response?.toString() ?? 'Server error [$statusCode]';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No internet connection.';
        break;
      case DioExceptionType.unknown:
      default:
        errorMessage = error.message ?? 'Unexpected network error.';
        break;
    }

    return {'error': true, 'statusCode': statusCode ?? 0, 'message': errorMessage, 'type': error.type.name};
  }
}
