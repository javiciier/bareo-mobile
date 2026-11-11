/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:redux/redux.dart';

// Project imports:
import '../application_root_state.dart';
import '../common/loading/action/status_selector.dart';

class AuthenticationStoreViewModel {
  final bool isLoading;
  final bool isAuthenticated;

  AuthenticationStoreViewModel({required this.isAuthenticated, required this.isLoading});

  factory AuthenticationStoreViewModel.fromStore(Store<ApplicationRootState> store) {
    bool authenticated = getAuthenticatedUser(store.state) != null;
    bool loading = isAuthenticationInProgress(store.state);

    return AuthenticationStoreViewModel(isLoading: loading, isAuthenticated: authenticated);
  }
}
