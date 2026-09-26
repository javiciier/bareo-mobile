/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'auth/page/auth_page.dart';
import 'home/page/home_page.dart';

final String applicationInitialRoute = AuthPage.routeName;

Map<String, WidgetBuilder> getApplicationRoutes() => {
  AuthPage.routeName: (context) => const AuthPage(),
  HomePage.routeName: (context) => const HomePage(),
};
