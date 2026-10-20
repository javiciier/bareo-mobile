/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../user/response/user_summary_response.dart';

class AuthenticatedUserResponse {
  final String token;
  final UserSummaryResponse user;

  const AuthenticatedUserResponse({required this.token, required this.user});

  factory AuthenticatedUserResponse.fromJson(Map<String, Object?> json) {
    UserSummaryResponse userSummaryResponse = UserSummaryResponse.fromJson(json['user'] as Map<String, Object?>);
    return AuthenticatedUserResponse(token: json['token'] as String, user: userSummaryResponse);
  }
}
