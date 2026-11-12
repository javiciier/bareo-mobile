/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:material_ui/material_ui.dart';
import 'package:sign_in_button/sign_in_button.dart';

// Project imports:
import '../../../app/configuration/dependency_injection.dart';
import '../../../app/mixin/logger_mixin.dart';
import '../../../application/usecase/authentication/authenticate_with_google_use_case.dart';
import '../../common/page/page_template.dart';

class SignInPage extends StatelessWidget with LoggerMixin {
  SignInPage({super.key});

  Future<void> _loginWithGoogle(BuildContext context) async {
    try {
      AuthenticateWithGoogleUseCase authenticateUseCase = GET_IT<AuthenticateWithGoogleUseCase>();
      await authenticateUseCase.execute();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString()), duration: const Duration(seconds: 4)));
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
                _loginWithGoogle(context);
              },
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
