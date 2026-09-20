/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../app/mixin/logger_mixin.dart';
import 'home_screen.dart';
import 'signin_screen.dart';

/// Screen that decides if the user is logged in or not.
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('No se ha podido iniciar sesión'));
          }

          // User is logged in
          if (snapshot.hasData && snapshot.data != null) {
            return const HomeScreen();
          }

          // No user is logged in: go to sign in page
          return const SignInPage();
        },
      ),
    );
  }
}
