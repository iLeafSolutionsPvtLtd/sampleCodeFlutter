import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/models/loading_status.dart';
import 'package:sewer_vewier/selectors/selectors.dart';

class AppLoading extends StatelessWidget {
  final Function(BuildContext context, LoadingStatus isLoading) builder;

  AppLoading({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoadingStatus>(
      distinct: true,
      converter: (Store<AppState> store) => isLoadingSelector(store.state),
      builder: builder,
    );
  }
}
