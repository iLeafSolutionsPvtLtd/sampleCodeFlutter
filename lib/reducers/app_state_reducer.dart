import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/models/login_state.dart';
import 'package:sewer_vewier/reducers/auth_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      authState: authReducer(state.authState, action),
      loginState: LoginState.initial());
}
