/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../../../infrastructure/dto/user/response/user_summary_response.dart';
import '../../../application_root_state.dart';
import '../../../application_root_state_selectors.dart';

bool isAuthenticationInProgress(ApplicationRootState rootState) => getAuthenticationFromState(rootState).status.loading;

UserSummaryResponse? getAuthenticatedUser(ApplicationRootState rootState) => getAuthenticationFromState(rootState).user;

Object? getAuthenticationError(ApplicationRootState rootState) => getAuthenticationFromState(rootState).status.error;
