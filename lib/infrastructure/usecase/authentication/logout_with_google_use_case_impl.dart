/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../app/mixin/logger_mixin.dart';
import '../../../application/service/authentication/authentication_service.dart';
import '../../../application/usecase/authentication/logout_with_google_use_case.dart';

class LogoutWithGoogleUseCaseImpl with LoggerMixin implements LogoutWithGoogleUseCase {
  final AuthenticationService authService;

  LogoutWithGoogleUseCaseImpl({required this.authService});

  @override
  Future<void> execute() async {
    try {
      await authService.logout();
    } catch (e) {
      logger.severe('Error logging out with Google', e);
    }
  }
}
