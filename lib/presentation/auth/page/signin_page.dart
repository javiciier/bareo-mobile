/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sign_in_button/sign_in_button.dart';

// Project imports:
import '../../../app/configuration/dependency_injection.dart';
import '../../../app/configuration/environment.dart';
import '../../../infrastructure/thirdparty/firebase/firebase_service.dart';
import '../../common/widget/page_template.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void _loginWithGoogle() async {
    FirebaseService firebaseService = di.get<FirebaseService>();
    firebaseService.signInwithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: ENV.appName,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: SignInButton(
              Buttons.google,
              onPressed: () {
                _loginWithGoogle();
                Navigator.pushNamed(context, '/auth');
              },
            ),
          ),
        ],
      ),
    );
  }
}
