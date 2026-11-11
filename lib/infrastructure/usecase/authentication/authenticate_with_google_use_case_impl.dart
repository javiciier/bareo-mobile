/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../app/mixin/logger_mixin.dart';
import '../../../application/service/authentication/authentication_service.dart';
import '../../../application/usecase/authentication/authenticate_with_google_use_case.dart';
import '../../dto/user/response/user_summary_response.dart';

class AuthenticateWithGoogleUseCaseImpl with LoggerMixin implements AuthenticateWithGoogleUseCase {
  final AuthenticationService authService;

  AuthenticateWithGoogleUseCaseImpl({required this.authService});

  @override
  Future<UserSummaryResponse?> execute() async {
    try {
      return await authService.authenticate();
    } catch (e) {
      logger.severe('Unable to authenticate with Google', e);

      throw Exception('Unable to authenticate with Google');
    }
  }
}
