/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Project imports:
import '../../../app/mixin/logger_mixin.dart';
import '../../thirdparty/firebase/firebase_service.dart';

class FirebaseTokenInterceptor extends Interceptor with LoggerMixin {
  final FirebaseService firebaseService;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  FirebaseTokenInterceptor({required this.firebaseService});

  Future<String?> _getToken() async {
    // Get token from storage
    String? token = await _secureStorage.read(key: 'firebase_token');

    // Get token from Firebase
    if (token == null || token.isEmpty) {
      final User? currentUser = await firebaseService.getCurrentLoggedInUser();
      if (currentUser != null) {
        token = await currentUser.getIdToken();
      }
    }

    if (token == null || token.isEmpty) {
      logger.severe('No authentication token can be attached to the request');
    }

    return token;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String? token = await _getToken();
      if (token != null) {
        options.headers['authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
          type: DioExceptionType.unknown,
          message: 'Error attaching token to request',
        ),
      );
    }
  }
}
