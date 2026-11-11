/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// Project imports:
import '../../../../../application/usecase/authentication/authenticate_with_google_use_case.dart';
import '../../../../../infrastructure/dto/user/response/user_summary_response.dart';
import '../../../../configuration/dependency_injection.dart';
import '../../../index.dart';
import '../google_authentication_failed_action.dart';
import '../google_authentication_started_action.dart';
import '../google_authentication_successful_action.dart';

ThunkAction<ApplicationRootState>? googleAuthenticateAsyncAction({
  Function? onSuccessCallback,
  Function? onErrorCallback,
}) {
  AuthenticateWithGoogleUseCase googleAuthenticateUseCase = GET_IT<AuthenticateWithGoogleUseCase>();

  return (Store<ApplicationRootState> store) async {
    store.dispatch(GoogleAuthenticationStartedAction());

    void onSuccess(UserSummaryResponse userSummary) {
      store.dispatch(GoogleAuthenticationSuccessfulAction(userSummary: userSummary));
      onSuccessCallback?.call(userSummary);
    }

    void onError(String errorMessage) {
      store.dispatch(GoogleAuthenticationFailedAction(errorMessage: errorMessage));
      onErrorCallback?.call(errorMessage);
    }

    try {
      UserSummaryResponse? userSummary = await googleAuthenticateUseCase.execute();
      if (userSummary != null) {
        onSuccess(userSummary);
      }
    } catch (e) {
      onError(e.toString());
    }
  };
}
