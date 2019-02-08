import 'package:sewer_vewier/models/auth_state.dart';
import 'package:sewer_vewier/models/login_state.dart';

class AppState {
  final AuthState authState;
  final LoginState loginState;
  const AppState({this.authState, this.loginState});

  factory AppState.initial() => AppState(
      authState: AuthState.initial(), loginState: LoginState.initial());

  AppState copyWith({
    AuthState authState,
    LoginState loginState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      loginState: loginState ?? this.loginState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          authState == other.authState &&
          loginState == other.loginState;

  @override
  int get hashCode => authState.hashCode ^ loginState.hashCode;
  @override
  String toString() {
    return '';
  }
}
