/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../presentation/routes.dart';
import 'configuration/environment.dart';
import 'configuration/localization.dart';
import 'theme/theme.dart';

class BareoApp extends StatelessWidget {
  const BareoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ENV.appName,
      localizationsDelegates: LocalizationConfiguration.localizationsDelegates,
      supportedLocales: LocalizationConfiguration.supportedLocales,
      theme: buildApplicationTheme(),
      initialRoute: applicationInitialRoute,
      routes: getApplicationRoutes(),
    );
  }
}
