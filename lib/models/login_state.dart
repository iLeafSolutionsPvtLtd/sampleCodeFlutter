import 'package:meta/meta.dart';
import 'package:sewer_vewier/models/loading_status.dart';

class LoginState {
  final LoadingStatus loadingStatus;
  final String password;
  final String passwordError;
  final String retypePassword;
  final String retypePasswordError;
  final String email;
  final String emailError;
  final String token;

  LoginState({
    @required this.loadingStatus,
    @required this.password,
    @required this.passwordError,
    @required this.retypePassword,
    @required this.retypePasswordError,
    @required this.email,
    @required this.emailError,
    @required this.token,
  });

  factory LoginState.initial() {
    return new LoginState(
      loadingStatus: LoadingStatus.success,
      password: "",
      passwordError: "",
      retypePassword: "",
      retypePasswordError: "",
      email: "",
      emailError: "",
      token: "",
    );
  }

  LoginState copyWith({
    LoadingStatus loadingStatus,
    String password,
    String passwordError,
    String retypePassword,
    String retypePasswordError,
    String email,
    String emailError,
    String token,
  }) {
    return new LoginState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      retypePassword: retypePassword ?? this.retypePassword,
      retypePasswordError: retypePasswordError ?? this.retypePasswordError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      token: token ?? this.token,
    );
  }
}
