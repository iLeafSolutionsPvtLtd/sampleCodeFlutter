import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/selectors/selectors.dart';

class PasswordValidator extends StatelessWidget {
  final Function(BuildContext context, bool isPasswordValid) builder;

  const PasswordValidator({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        converter: (Store<AppState> store) => isPasswordValid(store.state),
        builder: builder);
  }
}
