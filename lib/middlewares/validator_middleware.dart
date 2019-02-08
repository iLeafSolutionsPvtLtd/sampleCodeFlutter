import 'package:redux/redux.dart';
import 'package:sewer_vewier/actions/login_user_action.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/strings.dart';

class ValidationMiddleware extends MiddlewareClass<AppState> {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if (action is ValidateEmailAction) {
      validateEmail(action.email, next);
    }
  }
//  void validatePassword(String password, NextDispatcher next) {
//    if(password.length<6){
//      next(new PasswordErrorAction(password_error,screen));
//    }else{
//      next(new PasswordErrorAction("",screen));
//    }
//  }

  void validateEmail(String email, NextDispatcher next) {
    RegExp exp = new RegExp(emailPattern);
    if (!exp.hasMatch(email)) {
      next(new EmailErrorAction(email_error, false));
    } else {
      next(new EmailErrorAction("", true));
    }
  }
}
