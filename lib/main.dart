/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';

// Project imports:
import 'app/app.dart';
import 'app/configuration/dependency_injection.dart';
import 'app/configuration/logging.dart';
import 'app/state/application_root_state.dart';
import 'app/state/redux_configuration.dart';
import 'infrastructure/thirdparty/firebase/firebase_options.dart';

Logger _logger = Logger('Main');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGlobalConfiguration();

  // Initialize application state management
  final Store<ApplicationRootState> store = initReduxStore();

  _logger.info('Starting application');
  runApp(
    StoreProvider<ApplicationRootState>(store: store, child: const BareoApp()),
  );
}

Future<void> setupGlobalConfiguration() async {
  _logger.config('Setting up global application configuration');

  await dotenv.load();
  setupLoggers();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupDependencyInjections();
}
