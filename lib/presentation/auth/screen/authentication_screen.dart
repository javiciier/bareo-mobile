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
import 'initial_screen.dart';

/// Screen that decides if the user is logged in or not.
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: .center,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Text('Bienvenido'),
                      Text('${snapshot.data?.displayName}'),
                    ],
                  ),
                ),
              ],
            );
          }
          return const WelcomeScreen();
        },
      ),
    );
  }
}
