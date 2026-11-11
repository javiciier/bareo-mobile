/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'authentication/authentication_reducer.dart';
import 'authentication/authentication_state.dart';
import 'common/loading/loading_reducer.dart';
import 'common/loading/loading_state.dart';

@immutable
class ApplicationRootState {
  // Global app state goes here
  final LoadingState loadingState;
  final AuthenticationState authenticationState;

  const ApplicationRootState({required this.loadingState, required this.authenticationState});

  /// Default initial application state
  factory ApplicationRootState.initialState() => ApplicationRootState(
    loadingState: LoadingState.initialState(),
    authenticationState: AuthenticationState.initialState(),
  );

  static ApplicationRootState rootStateReducer(ApplicationRootState state, dynamic action) => ApplicationRootState(
    loadingState: loadingReducer(state.loadingState, action),
    authenticationState: authenticationReducer(state.authenticationState, action),
  );
}
