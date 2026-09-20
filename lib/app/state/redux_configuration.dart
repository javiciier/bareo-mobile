/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

// Project imports:
import 'application_root_state.dart';
import 'middleware/redux_logger_middleware.dart';

Store<ApplicationRootState> initReduxStore() {
  return Store<ApplicationRootState>(
    applicationRootStateReducer,
    initialState: ApplicationRootState.initialState(),
    middleware: configureMiddlewares(),
  );
}

List<Middleware<ApplicationRootState>> configureMiddlewares() {
  return [
    // (store, action, next) => thunkMiddleware(store, action, next),
    thunkMiddleware,
    ...createLoggingMiddleware(),
    LoggingMiddleware.printer().call,
  ];
}
