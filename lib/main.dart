import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/containers/login_page.dart';
import 'package:sewer_vewier/middlewares/get_user_details_middleware.dart';
import 'package:sewer_vewier/middlewares/validator_middleware.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/reducers/app_state_reducer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initial(),
      middleware: [GetUserDetailsMiddleware(), ValidationMiddleware()],
    );
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginView()));
  }
}
