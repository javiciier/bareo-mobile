// Package imports:
import 'package:redux/redux.dart';
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
  ];
}
