// actual action from here

import 'package:sewer_vewier/models/login_request_model.dart';

class UpdateLoadingStatus {
  final bool status;

  UpdateLoadingStatus(this.status);
}

class UpdateErrorStatus {
  final bool status;

  UpdateErrorStatus(this.status);
}

class LoginUserAction {
  final LoginRequest request;
  LoginUserAction(this.request);
}
