import 'package:redux/redux.dart';
import 'package:sewer_vewier/actions/login_user_action.dart';
import 'package:sewer_vewier/actions/navigation_actions.dart';
import 'package:sewer_vewier/api/login_api.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/models/loading_status.dart';
import 'package:sewer_vewier/selectors/keys.dart';
import 'package:sewer_vewier/strings.dart';

List<Middleware<AppState>> appMiddleware([AppState state]) {
  final getUserDetails = _getUserMiddleware(state);
  final validationMiddleware = _validationMiddleWare(state);
  final navigationMiddleware = _navigatorMiddleware(state);
  return [
    TypedMiddleware<AppState, LoginUserAction>(getUserDetails),
    TypedMiddleware<AppState, ValidateEmailAction>(validationMiddleware),
    TypedMiddleware<AppState, ValidatePasswordAction>(validationMiddleware),
    TypedMiddleware<AppState, NavigateToHomeAction>(navigationMiddleware),
  ];
}

Middleware<AppState> _getUserMiddleware(AppState state) {
  return (Store store, action, NextDispatcher next) {
    next(action);
    store.dispatch(ChangeLoadingStatusAction(LoadingStatus.loading));
    loginUser(request: action.request).then((user) {
      store.dispatch(ChangeLoadingStatusAction(LoadingStatus.success));
      store.dispatch(NavigateToHomeAction());
    });
  };
}

Middleware<AppState> _validationMiddleWare(AppState state) {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  void validateEmail(String email, NextDispatcher next) {
    RegExp exp = new RegExp(emailPattern);
    if (!exp.hasMatch(email)) {
      next(new EmailErrorAction(email_error, false));
    } else {
      next(new EmailErrorAction("", true));
    }
  }

  void validatePassword(String password, NextDispatcher next) {
    if (password.length < 6) {
      next(PasswordErrorAction("", false));
    } else {
      next(PasswordErrorAction("", true));
    }
  }

  return (Store store, action, NextDispatcher next) {
    if (action is ValidateEmailAction) {
      validateEmail(action.email, next);
    } else if (action is ValidatePasswordAction) {
      validatePassword(action.password, next);
    }
  };
}

Middleware<AppState> _navigatorMiddleware(AppState state) {
  return (Store store, action, NextDispatcher next) {
    if (action is NavigateToHomeAction) {
      Keys.navKey.currentState.pushReplacementNamed("/home");
    } else if (action is NavigateToDetailsPage) {
      Keys.navKey.currentState.pushReplacementNamed("/details");
    }
  };
}
