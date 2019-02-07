import 'package:meta/meta.dart';

class AppState {
  final bool isLoading;
  final bool isError;
  const AppState({
    @required this.isLoading,
    @required this.isError,
  });
  factory AppState.loading() => AppState(isLoading: false, isError: false);

  @override
  String toString() {
    // TODO: implement toString
    return '';
  }
}
