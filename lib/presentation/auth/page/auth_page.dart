/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';

// Project imports:
import '../../../app/mixin/logger_mixin.dart';
import '../../../app/state/application_root_state.dart';
import '../../../app/state/authentication/authentication_store_view_model.dart';
import '../../home/page/home_page.dart';
import 'signin_page.dart';

/// Screen that decides if the user is logged in or not.
class AuthPage extends StatefulWidget {
  static final String routeName = '/auth';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<ApplicationRootState, AuthenticationStoreViewModel>(
        converter: (store) => AuthenticationStoreViewModel.fromStore(store),
        builder: (BuildContext context, AuthenticationStoreViewModel vm) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.isAuthenticated) {
            return const HomePage();
          }

          return SignInPage();
        },
      ),
    );
  }
}
