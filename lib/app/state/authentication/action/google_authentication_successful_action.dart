/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../../../infrastructure/dto/user/response/user_summary_response.dart';

class GoogleAuthenticationSuccessfulAction {
  final UserSummaryResponse userSummary;

  const GoogleAuthenticationSuccessfulAction({required this.userSummary});
}
