// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'common/loading/loading_reducer.dart';
import 'common/loading/loading_state.dart';

@immutable
class ApplicationRootState {
  // Global app state goes here
  final LoadingState loadingState;

  const ApplicationRootState({required this.loadingState});

  /// Default initial application state
  factory ApplicationRootState.initialState() =>
      ApplicationRootState(loadingState: LoadingState.initialState());

  ApplicationRootState reducer(ApplicationRootState state, dynamic action) =>
      ApplicationRootState(
        loadingState: loadingReducer(state.loadingState, action),
      );
}

ApplicationRootState applicationRootStateReducer(
  ApplicationRootState state,
  dynamic action,
) => ApplicationRootState(
  loadingState: loadingReducer(state.loadingState, action),
);
