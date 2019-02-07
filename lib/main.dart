import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/containers/login_page.dart';
import 'package:sewer_vewier/models/models.dart';
import 'package:sewer_vewier/redux/middleware.dart';
import 'package:sewer_vewier/redux/reducers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(appStateReducer,
        initialState: AppState.loading(), middleware: appStateMiddleware());
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
