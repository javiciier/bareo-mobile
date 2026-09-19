/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

class ErrorAction<E extends Object> {
  final E _error;

  ErrorAction(this._error);

  Object get getError => _error;

  @override
  String toString() => 'ErrorAction(error: $_error)';
}
