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
import '../../../app/mixin/logger_mixin.dart';
import '../../../infrastructure/thirdparty/firebase/firebase_service.dart';
import '../../common/page/page_template.dart';

class SignInPage extends StatelessWidget with LoggerMixin {
  SignInPage({super.key});

  Future<void> _loginWithGoogle() async {
    FirebaseService firebaseService = DEPENDENCIES_CONTAINER
        .get<FirebaseService>();
    final user = await firebaseService.signInwithGoogle();
    if (user != null) {
      logger.info('User logged in with Google: ${user.email}');
    } else {
      logger.warning('Google sign in failed or was cancelled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Column(
        children: [
          const Spacer(flex: 2),
          Center(
            child: SignInButton(
              Buttons.google,
              onPressed: () {
                _loginWithGoogle();
              },
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
