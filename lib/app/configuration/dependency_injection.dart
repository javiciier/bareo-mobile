/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../../infrastructure/thirdparty/firebase/firebase_service.dart';

final di = GetIt.instance;

Future<void> setupDependencyInjections() async {
  _initializeDependencies();
  _registerRepositoriesDependencies();
  _registerServicesDependencies();
  _registerUseCasesDependencies();
  _registerPresentationDependencies();
}

void _initializeDependencies() async {}

void _registerRepositoriesDependencies() {}

void _registerServicesDependencies() {
  di.registerLazySingleton<FirebaseService>(() => FirebaseService());
}

void _registerUseCasesDependencies() {}

void _registerPresentationDependencies() {}
