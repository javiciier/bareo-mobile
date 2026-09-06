// Package imports:
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';

// Project imports:
import '../application_root_state.dart';

final Logger _logger = Logger('ReduxLoggerMiddleware');

List<Middleware<ApplicationRootState>> createLoggingMiddleware() => [
  _logAction,
];

void _logAction(
  Store<ApplicationRootState> store,
  dynamic action,
  NextDispatcher next,
) {
  _logger.fine('Dispatching action: ${action.runtimeType} | Payload: $action');

  next(action);
}
