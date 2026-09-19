/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import '../../../app/mixin/logger_mixin.dart';
import 'google_application_scopes.dart';

class FirebaseService with LoggerMixin {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  late final FirebaseAuth _firebaseAuth;
  bool _isGoogleSignInInitialized = false;

  FirebaseService({FirebaseAuth? firebaseAuth}) {
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    if (_isGoogleSignInInitialized) {
      return;
    }

    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      logger.severe('Error initializing Google Sign-In: $e');
    }
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (_isGoogleSignInInitialized) {
      return;
    }

    await _initializeGoogleSignIn();
  }

  /// Sign in user using Google account
  Future<User?> loginWithGoogle() async {
    try {
      await _ensureGoogleSignInInitialized();
      // Open accounts selector and wait for user selection
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      // Retrieve authentication tokens from Google
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      if (googleAuth.idToken == null) {
        logger.warning('Google Sign In failed: ID token is missing.');
        return null;
      }

      // Request necesary scopes to obtain the access token
      final authClient = _googleSignIn.authorizationClient;
      final GoogleSignInClientAuthorization authorization = await authClient
          .authorizeScopes(ApplicationRequiredScopes.requiredApplicationScopes);

      // Create Firebase credential using Google tokens
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: authorization.accessToken,
      );

      // Authenticate with Firebase using the credential
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      return userCredential.user;
    } catch (e, stackTrace) {
      logger.severe('Error logging in with Google', e, stackTrace);
      return null;
    }
  }

  /// Sign out from Google
  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
