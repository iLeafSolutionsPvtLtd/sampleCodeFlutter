import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/containers/home_page/home_page.dart';
import 'package:sewer_vewier/containers/login_page.dart';
import 'package:sewer_vewier/middlewares/app_middleware.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/reducers/app_state_reducer.dart';
import 'package:sewer_vewier/selectors/keys.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initial(),
      middleware: appMiddleware(),
    );
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginView(),
            navigatorKey: Keys.navKey,
            routes: <String, WidgetBuilder>{
              "/signin": (BuildContext context) => new LoginView(),
              "/home": (BuildContext context) => new HomePage(),
            }));
  }
}
