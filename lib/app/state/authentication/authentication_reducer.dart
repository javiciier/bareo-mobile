/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:redux/redux.dart';

// Project imports:
import '../common/loading/loading_state.dart';
import 'action/google_authentication_failed_action.dart';
import 'action/google_authentication_started_action.dart';
import 'action/google_authentication_successful_action.dart';
import 'authentication_state.dart';

AuthenticationState authenticate(AuthenticationState prevState, dynamic action) {
  if (action is GoogleAuthenticationStartedAction) {
    return prevState.copyWith(loading: prevState.status.copyWith(loading: true), user: prevState.user);
  }

  if (action is GoogleAuthenticationFailedAction) {
    return prevState.copyWith(
      loading: prevState.status.copyWith(loading: false, error: action.errorMessage),
      user: prevState.user,
    );
  }

  if (action is GoogleAuthenticationSuccessfulAction) {
    return prevState.copyWith(loading: const LoadingState(loading: false, error: null), user: action.userSummary);
  }

  return prevState;
}

final authenticationReducer = combineReducers<AuthenticationState>([authenticate]);
