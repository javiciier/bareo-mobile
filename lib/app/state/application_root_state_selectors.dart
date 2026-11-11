/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import 'application_root_state.dart';
import 'authentication/authentication_state.dart';
import 'common/loading/loading_state.dart';

LoadingState getLoadingFromState(ApplicationRootState rootState) => rootState.loadingState;

AuthenticationState getAuthenticationFromState(ApplicationRootState rootState) => rootState.authenticationState;
