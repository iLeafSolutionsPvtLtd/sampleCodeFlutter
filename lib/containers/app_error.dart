import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/models/models.dart';
import 'package:sewer_vewier/selectors/selectors.dart';

class AppError extends StatelessWidget {
  final Function(BuildContext context, bool isError) builder;

  const AppError({Key key, @required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (Store<AppState> store) => isErrorSelector(store.state),
      builder: builder,
    );
  }
}
