// Package imports:
import 'package:redux/redux.dart';

// Project imports:
import 'action/index.dart';
import 'loading_state.dart';

LoadingState loading(LoadingState prevState, dynamic action) {
  if (action is LoadingAction) {
    return prevState.copyWith(loading: true);
  }
  if (action is LoadedAction) {
    return prevState.copyWith(loading: false);
  }
  if (action is ErrorAction) {
    return prevState.copyWith(loading: false, error: action.getError);
  }

  return prevState;
}

LoadingState error(LoadingState prevState, dynamic action) {
  if (action is ErrorAction) {
    final Object error = action.getError;
    return prevState.copyWith(error: error);
  }

  return prevState;
}

final loadingReducer = combineReducers<LoadingState>([loading, error]);
