/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/configuration/dependency_injection.dart';
import '../../../infrastructure/thirdparty/firebase/firebase_service.dart';
import '../../common/widget/page_template.dart';
import '../widget/home_header.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/home';

  const HomePage({super.key});

  void _logoutWithGoogle() async {
    FirebaseService firebaseService = di.get<FirebaseService>();
    await firebaseService.signOutFromGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Home Page',
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const HomeHeader(),
            ElevatedButton(
              onPressed: () => _logoutWithGoogle(),
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
