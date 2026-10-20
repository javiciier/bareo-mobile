/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

class GoogleAuthenticationRequest {
  final String token;

  const GoogleAuthenticationRequest({required this.token});

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
