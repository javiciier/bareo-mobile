/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

class UserSummaryResponse {
  final String id;
  final String? username;
  final String? avatarUrl;
  final String? city;

  const UserSummaryResponse({required this.id, this.username, this.avatarUrl, this.city});

  factory UserSummaryResponse.fromJson(Map<String, Object?> json) {
    return UserSummaryResponse(
      id: json['id'] as String,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      city: json['city'] as String?,
    );
  }
}
