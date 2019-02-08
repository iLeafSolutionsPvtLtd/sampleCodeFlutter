import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/models/loading_status.dart';

LoadingStatus isLoadingSelector(AppState state) =>
    state.authState.loadingStatus;
bool isErrorSelector(AppState state) =>
    state.authState.loadingStatus == LoadingStatus.error;
bool isEmailValid(AppState state) => state.authState.emailError;

bool isPasswordValid(AppState state) => state.authState.passwordError;
