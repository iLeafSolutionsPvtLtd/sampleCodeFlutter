import 'dart:ui';

import 'package:sewer_vewier/models/loading_status.dart';
import 'package:sewer_vewier/models/login_request_model.dart';

class LoginUserAction {
  final LoginRequest request;

  LoginUserAction(this.request);
}

class ValidateEmailAction {
  final String email;
  ValidateEmailAction(this.email);
}

class ValidatePasswordAction {
  final String password;
  ValidatePasswordAction(this.password);
}

class ValidateLoginFields {
  final String email;
  final String password;

  ValidateLoginFields(this.email, this.password);
}

class ValidatePasswordMatchAction {
  final String password;
  final String confirmPassword;
  ValidatePasswordMatchAction(this.password, this.confirmPassword);
}

class ValidateSignUpFieldsAction {
//  final SignUpRequest request;
//  ValidateSignUpFieldsAction(this.request);
}

class ValidateCodeAction {
  final String code;
  ValidateCodeAction(this.code);
}

class ChangeLoadingStatusAction {
  final LoadingStatus status;
  ChangeLoadingStatusAction(this.status);
}

class EmailErrorAction {
  final bool status;
  final String message;
  EmailErrorAction(this.message, this.status);
}

class PasswordErrorAction {
  final String message;
  PasswordErrorAction(this.message);
}

class RetypePasswordErrorAction {
  final String message;
  RetypePasswordErrorAction(this.message);
}

class CodeErrorAction {
  final String message;
  CodeErrorAction(this.message);
}

class SaveTokenAction {
  final String token;
  SaveTokenAction(this.token);
}

class RequestCodeAction {
  final String email;
  RequestCodeAction(this.email);
}

class ConfirmForgotPasswordAction {
  final String code;
  final String password;
  ConfirmForgotPasswordAction(this.code, this.password);
}

class CheckTokenAction {
  final VoidCallback hasTokenCallback;
  final VoidCallback noTokenCallback;

  CheckTokenAction({this.hasTokenCallback, this.noTokenCallback});
}

class ClearErrorsAction {}

class NavigateToRegistrationAction {}
