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
import '../../../app/configuration/dependency_injection.dart';
import '../../../app/configuration/environment.dart';
import '../../../infrastructure/thirdparty/firebase/firebase_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _loginWithGoogle() async {
    FirebaseService firebaseService = di.get<FirebaseService>();
    User? user = await firebaseService.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Center(child: Text(ENV.appName)),
            ElevatedButton(
              onPressed: () => _loginWithGoogle(),
              child: const Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
