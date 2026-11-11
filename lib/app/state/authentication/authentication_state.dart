/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import '../../../infrastructure/dto/user/response/user_summary_response.dart';
import '../common/loading/loading_state.dart';

@immutable
class AuthenticationState {
  final LoadingState status;
  final UserSummaryResponse? user;

  const AuthenticationState({required this.status, required this.user});

  factory AuthenticationState.initialState() => AuthenticationState(status: LoadingState.initialState(), user: null);

  AuthenticationState copyWith({LoadingState? loading, UserSummaryResponse? user}) {
    return AuthenticationState(status: loading ?? status, user: user ?? this.user);
  }
}
