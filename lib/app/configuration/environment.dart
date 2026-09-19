/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static String get appName => dotenv.get('APP_NAME', fallback: 'Bareo');
}
