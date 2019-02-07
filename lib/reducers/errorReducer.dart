import 'package:redux/redux.dart';
import 'package:sewer_vewier/redux/actions.dart';

final errorReducer = combineReducers<bool>([
  TypedReducer<bool, UpdateErrorStatus>(_setLoaded),
]);

bool _setLoaded(bool state, UpdateErrorStatus action) {
  return action.status;
}
