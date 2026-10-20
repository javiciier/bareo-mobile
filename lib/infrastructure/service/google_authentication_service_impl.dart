/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Project imports:
import '../../app/mixin/logger_mixin.dart';
import '../../application/service/authentication/authentication_service.dart';
import '../dto/auth/response/authenticated_user_response.dart';
import '../network/network_client.dart';
import '../thirdparty/firebase/firebase_service.dart';

class GoogleAuthenticationServiceImpl with LoggerMixin implements AuthenticationService {
  final String BASE_ENDPOINT = '/auth/google';
  final String FIREBASE_TOKEN_STORAGE_KEY = 'firebase_token';

  final FirebaseService firebaseService;
  final NetworkClient networkClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  GoogleAuthenticationServiceImpl({required this.firebaseService, required this.networkClient});

  @override
  Future<void> authenticate() async {
    // Sign in with google
    User? user = await firebaseService.signInWithGoogle();
    String? token = await user?.getIdToken(true);

    // Authenticate on backend
    void onSuccessCallback(Map<String, Object?> response) {
      AuthenticatedUserResponse authenticatedUserResponse = AuthenticatedUserResponse.fromJson(response);
      _secureStorage.write(key: FIREBASE_TOKEN_STORAGE_KEY, value: authenticatedUserResponse.token);
      logger.fine('Authentication on backend successful');
    }

    void onErrorCallback(Map<String, Object?> response) {
      _secureStorage.delete(key: FIREBASE_TOKEN_STORAGE_KEY);
      logger.severe('Authentication on backend failed. Forcing logout...');
      logout();
    }

    Map<String, String?> body = {'idToken': token};
    await networkClient.post(BASE_ENDPOINT, data: body, onSuccess: onSuccessCallback, onError: onErrorCallback);
  }

  @override
  Future<void> logout() async {
    final String endpoint = '$BASE_ENDPOINT/logout';

    // Remove authentication on backend
    void onSuccessCallback(Map<String, Object?> response) {
      firebaseService.signOutFromGoogle();
      _secureStorage.delete(key: FIREBASE_TOKEN_STORAGE_KEY);
    }

    void onErrorCallback(Map<String, Object?> response) {
      firebaseService.signOutFromGoogle();
      _secureStorage.delete(key: FIREBASE_TOKEN_STORAGE_KEY);
      logger.fine('Logged out succesfully');
    }

    await networkClient.post(endpoint, onSuccess: onSuccessCallback, onError: onErrorCallback);
  }
}
