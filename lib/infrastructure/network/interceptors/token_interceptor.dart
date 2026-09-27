/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../app/configuration/dependency_injection.dart';
import '../../thirdparty/firebase/firebase_service.dart';

FirebaseService firebaseService = DEPENDENCIES_CONTAINER.get<FirebaseService>();

// Interceptor that inyects the Bearer Token from Firebase for each network request
Interceptor TokenInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    User? currentUser = await firebaseService.getCurrentLoggedInUser();
    String? firebaseToken = await currentUser?.getIdToken(true);
    options.headers['Authorization'] = 'Bearer $firebaseToken';

    return handler.next(options);
  },
);
