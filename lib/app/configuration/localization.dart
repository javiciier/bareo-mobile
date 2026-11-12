/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:material_ui/material_ui.dart';

// Project imports:
import '../l10n/localizations.dart';

// MORE INFO: https://localizely.com/flutter-arb/

class LocalizationConfiguration {
  static const Iterable<Locale> supportedLocales = [Locale('en', ''), Locale('es', '')];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
  ];
}
