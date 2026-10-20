/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../../application/service/authentication/authentication_service.dart';
import '../../application/usecase/authentication/authenticate_with_google_use_case.dart';
import '../../application/usecase/authentication/logout_with_google_use_case.dart';
import '../../infrastructure/network/interceptors/request_traceability_interceptor.dart';
import '../../infrastructure/network/interceptors/token_interceptor.dart';
import '../../infrastructure/network/network_client.dart';
import '../../infrastructure/service/google_authentication_service_impl.dart';
import '../../infrastructure/thirdparty/firebase/firebase_service.dart';
import '../../infrastructure/usecase/authentication/authenticate_with_google_use_case_impl.dart';
import '../../infrastructure/usecase/authentication/logout_with_google_use_case_impl.dart';

final GET_IT = GetIt.instance;

Future<void> setupDependencyInjections() async {
  _initializeDependencies();
  _registerRepositories();
  _registerServices();
  _registerUseCases();
  _registerPresentationDependencies();
}

void _initializeNetworkClient() async {
  GET_IT.registerSingleton<NetworkClient>(
    NetworkClient(
      tokenInterceptor: FirebaseTokenInterceptor(firebaseService: GET_IT<FirebaseService>()),
      requestTraceabilityInterceptor: RequestTraceabilityInterceptor(firebaseService: GET_IT<FirebaseService>()),
    ),
  );
}

void _initializeDependencies() async {
  GET_IT.registerSingleton<FirebaseService>(FirebaseService());
  _initializeNetworkClient();
}

void _registerRepositories() async {}

void _registerServices() async {
  GET_IT.registerLazySingleton<AuthenticationService>(
    () => GoogleAuthenticationServiceImpl(
      firebaseService: GET_IT<FirebaseService>(),
      networkClient: GET_IT<NetworkClient>(),
    ),
  );
}

void _registerUseCases() async {
  GET_IT.registerLazySingleton<AuthenticateWithGoogleUseCase>(
    () => AuthenticateWithGoogleUseCaseImpl(authService: GET_IT<AuthenticationService>()),
  );
  GET_IT.registerLazySingleton<LogoutWithGoogleUseCase>(
    () => LogoutWithGoogleUseCaseImpl(authService: GET_IT<AuthenticationService>()),
  );
}

void _registerPresentationDependencies() async {}
