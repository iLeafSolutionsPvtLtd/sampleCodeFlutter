import 'package:redux/redux.dart';
import 'package:sewer_vewier/redux/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, UpdateLoadingStatus>(_setLoaded),
]);

bool _setLoaded(bool state, UpdateLoadingStatus action) {
  return action.status;
}
