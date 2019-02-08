import 'package:redux/redux.dart';
import 'package:sewer_vewier/actions/login_user_action.dart';
import 'package:sewer_vewier/api/login_api.dart';
import 'package:sewer_vewier/models/loading_status.dart';

class GetUserDetailsMiddleware extends MiddlewareClass {
  @override
  void call(Store store, action, NextDispatcher next) {
    next(action);
    if (action is LoginUserAction) {
      store.dispatch(ChangeLoadingStatusAction(LoadingStatus.loading));
      loginUser(request: action.request).then((user) {
        store.dispatch(ChangeLoadingStatusAction(LoadingStatus.success));
      });
    }
  }
}
