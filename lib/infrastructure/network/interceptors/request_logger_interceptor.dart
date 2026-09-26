/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_clean_logger/pretty_dio_clean_logger.dart';

Interceptor RequestLoggerInterceptor = PrettyDioCleanLogger(
  enabled: kDebugMode,
  requestHeader: true,
  requestBody: true,
  error: true,
);
