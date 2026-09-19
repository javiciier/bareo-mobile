/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/widgets.dart';

@immutable
class LoadingState {
  final bool loading;
  final Object? error;

  const LoadingState({required this.loading, required this.error});

  factory LoadingState.initialState() =>
      const LoadingState(loading: false, error: null);

  LoadingState copyWith({bool? loading, Object? error}) {
    return LoadingState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() => 'BaseLoadingState(loading: $loading, error: $error)';
}
