import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../i18n/translations/app_localizations.dart';

// MORE INFO: https://localizely.com/flutter-arb/

class LocalizationConfiguration {
  static const Iterable<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('es', ''),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates];
}
