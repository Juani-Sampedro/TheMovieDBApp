enum ResultState {
  loading,
  error,
  success,
  empty,
}

class DataState<T> {
  DataState({
    this.data,
    required this.resultState,
    this.errorMsg,
  });

  final T? data;
  final ResultState resultState;
  final String? errorMsg;

  @override
  bool operator ==(Object other) {
    return other is DataState &&
        this.resultState == other.resultState &&
        runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => data.hashCode ^ resultState.hashCode;
}
