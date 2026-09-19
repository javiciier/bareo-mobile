/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:googleapis/oauth2/v2.dart';

class ApplicationRequiredScopes {
  // Google Scopes usage: https://docs.flutter.dev/data-and-backend/google-apis
  // Scopes list: https://developers.google.com/identity/protocols/oauth2/scopes?hl=es-419

  static const List<String> requiredApplicationScopes = [
    Oauth2Api.openidScope,
    Oauth2Api.userinfoEmailScope,
    Oauth2Api.userinfoProfileScope,
  ];
}
