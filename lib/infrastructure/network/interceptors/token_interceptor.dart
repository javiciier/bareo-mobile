/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Interceptor that inyects the Bearer Token from Firebase for each network request
Interceptor TokenInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    final firebaseToken = await FirebaseAuth.instance.currentUser?.getIdToken(
      true,
    );
    options.headers['Authorization'] = 'Bearer $firebaseToken';

    return handler.next(options);
  },
);
