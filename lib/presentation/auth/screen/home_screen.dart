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
import '../../../infrastructure/thirdparty/firebase/firebase_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _logoutWithGoogle() async {
    FirebaseService firebaseService = di.get<FirebaseService>();
    await firebaseService.signOutFromGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Center(child: Text('Bienvenido a HomeScreen:')),
            Center(
              child: Text('${FirebaseAuth.instance.currentUser?.displayName}'),
            ),
            ElevatedButton(
              child: const Text('Cerrar sesión'),
              onPressed: () => _logoutWithGoogle(),
            ),
          ],
        ),
      ),
    );
  }
}
