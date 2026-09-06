// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import '../l10n/localizations.dart';

// MORE INFO: https://localizely.com/flutter-arb/

class LocalizationConfiguration {
  static const Iterable<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('es', ''),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates];
}
