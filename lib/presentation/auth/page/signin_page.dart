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
import '../../../application/usecase/authentication/authenticate_with_google_use_case.dart';
import '../../common/page/page_template.dart';

class SignInPage extends StatelessWidget with LoggerMixin {
  SignInPage({super.key});

  Future<void> _loginWithGoogle() async {
    AuthenticateWithGoogleUseCase authenticateUseCase = GET_IT<AuthenticateWithGoogleUseCase>();
    await authenticateUseCase.execute();
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
