// Package imports:
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void setupDependencyInjections() {
  _registerSharedDependencies();
  _registerRepositoriesDependencies();
  _registerServicesDependencies();
  _registerUseCasesDependencies();
  _registerPresentationDependencies();
}

void _registerSharedDependencies() {}

void _registerRepositoriesDependencies() {}

void _registerServicesDependencies() {}

void _registerUseCasesDependencies() {}

void _registerPresentationDependencies() {}
