import 'package:bareo_mobile/app/configuration/localization.dart';
import 'package:flutter/material.dart';

class BareoApp extends StatelessWidget {
  const BareoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bareo',
      localizationsDelegates: LocalizationConfiguration.localizationsDelegates,
      supportedLocales: LocalizationConfiguration.supportedLocales,
      theme: getApplicationTheme(),
      home: buildHome(),
    );
  }

  ThemeData getApplicationTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  Scaffold buildHome() => const Scaffold(body: Center(child: Text('Bareo')));
}
