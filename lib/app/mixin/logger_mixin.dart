/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:logging/logging.dart';

/// Mixin to inject loggers into classes.
/// Usage: class MyClass with LoggerMixin {}
mixin LoggerMixin {
  late final Logger logger = Logger('$runtimeType');
}
