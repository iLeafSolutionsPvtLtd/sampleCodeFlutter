import 'package:redux/redux.dart';
import 'package:sewer_vewier/actions/login_user_action.dart';
import 'package:sewer_vewier/models/auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, ChangeLoadingStatusAction>(
      _changeLoadingStatusAction),
  TypedReducer<AuthState, ValidateEmailAction>(_validateEmail),
  TypedReducer<AuthState, EmailErrorAction>(_emailErrorAction),
]);

AuthState _emailErrorAction(AuthState state, EmailErrorAction action) {
  return state.copyWith(
      emailError: action.status, emailErrorMessage: action.message);
}

AuthState _changeLoadingStatusAction(
    AuthState state, ChangeLoadingStatusAction action) {
  print('in action');
  print(action.status);
  return state.copyWith(loadingStatus: action.status);
}

AuthState _validateEmail(AuthState state, ValidateEmailAction action) {
  return state.copyWith(email: action.email);
}

AuthState _validatePassword(AuthState state, ValidatePasswordAction action) =>
    state.copyWith(password: action.password);
