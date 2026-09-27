/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static String get APP_NAME => dotenv.get('APP_NAME', fallback: 'Bareo');

  static String get BASE_URL =>
      dotenv.get('API_BASE_URL', fallback: 'http://localhost:8080/api');

  static String get GOOGLE_SERVER_CLIENT_ID => dotenv.get(
    'GOOGLE_SERVER_CLIENT_ID',
    fallback: '216630720184-66rmvjju72134h8egdii3tck1suvr0nr.apps.googleusercontent.com',
  );
}
