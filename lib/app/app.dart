// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../presentation/route/routes.dart';
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
