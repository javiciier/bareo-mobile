/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'auth/screen/auth_screen.dart';
import 'auth/screen/home_screen.dart';

const String applicationInitialRoute = '/auth';

Map<String, WidgetBuilder> getApplicationRoutes() => {
  applicationInitialRoute: (context) => const AuthScreen(),
  '/home': (context) => const HomeScreen(),
};
