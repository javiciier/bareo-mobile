/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import '../../thirdparty/firebase/firebase_service.dart';

class RequestTraceabilityInterceptor extends Interceptor {
  final FirebaseService firebaseService;

  RequestTraceabilityInterceptor({required this.firebaseService});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String requestId = const Uuid().v7();
      options.headers['X-Request-Id'] = requestId;

      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
          type: DioExceptionType.unknown,
          message: 'Error obtaining request traceability information',
        ),
      );
    }
  }
}
