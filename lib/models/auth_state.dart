import 'package:flutter/foundation.dart';
import 'package:sewer_vewier/models/loading_status.dart';

class AuthState {
  final LoadingStatus loadingStatus;
  final String password;
  final bool passwordError;
  final String retypePassword;
  final String retypePasswordError;
  final String email;
  final bool emailError;
  final String emailErrorMessage;
  final String passwordErrorMessage;
  final String token;

  AuthState({
    @required this.loadingStatus,
    @required this.password,
    @required this.passwordError,
    @required this.retypePassword,
    @required this.retypePasswordError,
    @required this.email,
    @required this.emailError,
    @required this.emailErrorMessage,
    @required this.passwordErrorMessage,
    @required this.token,
  });

  factory AuthState.initial() {
    return new AuthState(
      loadingStatus: LoadingStatus.success,
      password: "",
      passwordError: true,
      retypePassword: "",
      retypePasswordError: "",
      email: "",
      emailError: true,
      emailErrorMessage: "",
      passwordErrorMessage: "",
      token: "",
    );
  }

  AuthState copyWith({
    LoadingStatus loadingStatus,
    String password,
    bool passwordError,
    String retypePassword,
    String retypePasswordError,
    String email,
    bool emailError,
    String emailErrorMessage,
    String passwordErrorMessage,
    String token,
  }) {
    return new AuthState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      retypePassword: retypePassword ?? this.retypePassword,
      retypePasswordError: retypePasswordError ?? this.retypePasswordError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      passwordErrorMessage: passwordErrorMessage ?? this.passwordErrorMessage,
      emailErrorMessage: emailErrorMessage ?? this.emailErrorMessage,
      token: token ?? this.token,
    );
  }
}
