class ErrorAction<E extends Object> {
  final E _error;

  ErrorAction(this._error);

  Object get getError => _error;

  @override
  String toString() => 'ErrorAction(error: $_error)';
}
