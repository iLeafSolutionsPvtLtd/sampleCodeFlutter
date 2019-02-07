import 'package:sewer_vewier/models/models.dart';
import 'package:sewer_vewier/reducers/errorReducer.dart';
import 'package:sewer_vewier/reducers/loadingReducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      isError: errorReducer(state.isError, action));
}
