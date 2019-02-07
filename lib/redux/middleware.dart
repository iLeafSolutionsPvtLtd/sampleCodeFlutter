import 'package:redux/redux.dart';
import 'package:sewer_vewier/api/login_api.dart';
import 'package:sewer_vewier/models/models.dart';
import 'package:sewer_vewier/redux/actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = "";
  await preferences.setString('itemState', string);
}

Future<AppState> loadPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('itemState');
  if (string != null) {
    return AppState(isLoading: false, isError: true);
  }
  print('else case');
  return AppState.loading();
}

Middleware<AppState> _getUserDetails(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    if (action is LoginUserAction) {
      store.dispatch(UpdateLoadingStatus(true));
      loginUser(request: action.request).then((user) {
        store.dispatch(UpdateLoadingStatus(false));
      });
    }
  };
}

Middleware<AppState> _loadFromPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
//    store.dispatch(UpdateLoadingStatus(state.isLoading));
  };
}

//
Middleware<AppState> _saveToPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    // store.dispatch(UpdateErrorStatus(state.isError));
  };
}

List<Middleware<AppState>> appStateMiddleware([
  AppState state = const AppState(
    isError: false,
    isLoading: false,
  ),
]) {
  final loadItems = _loadFromPrefs(state);
  final saveItems = _saveToPrefs(state);
  final loginUser = _getUserDetails(state);
  return [
    TypedMiddleware<AppState, UpdateLoadingStatus>(loadItems),
    TypedMiddleware<AppState, UpdateErrorStatus>(saveItems),
    TypedMiddleware<AppState, LoginUserAction>(loginUser),
  ];
}
