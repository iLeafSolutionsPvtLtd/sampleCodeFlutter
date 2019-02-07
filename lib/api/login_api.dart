import 'package:sewer_vewier/models/login_request_model.dart';
import 'package:sewer_vewier/models/user_model.dart';

Future loginUser({request: LoginRequest}) async {
  await Future.delayed(Duration(seconds: 5), () {
    print('call in future');
    return User(name: 'Ansar');
  });
}
