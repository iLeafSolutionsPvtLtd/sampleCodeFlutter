import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/actions/navigation_actions.dart';
import 'package:sewer_vewier/containers/daily_log/daily_log_item.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/sv_colors.dart';

class DailyLogView extends StatefulWidget {
  DailyLogView({
    Key key,
  }) : super(key: key);

  @override
  _DailyLogViewState createState() => _DailyLogViewState();
}

class _DailyLogViewState extends State<DailyLogView> {
  Widget topView() => Container(
        height: 50,
        color: SVColors.sv_main_violet,
      );

  Widget title() => new Text("Projects",
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w600,
          fontFamily: "OpenSans",
          fontStyle: FontStyle.normal,
          fontSize: 15.0));

  Widget searchView(BuildContext context) => Container(
    height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white30),
            child: CupertinoTextField(
              suffix: Container(
                width: 38,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 0.5,
                        color: Colors.white30,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w400,
                  fontFamily: "GoogleSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 13.5),
              placeholder: 'Search Here',
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) => CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: SVColors.sv_main_violet,
            title: title(),
            actions: <Widget>[
              Icon(Icons.add),
              Container(
                width: 20,
              )
            ],
            pinned: true,
            floating: true,
            bottom: PreferredSize(
                child: searchView(context), preferredSize: Size(95.5, 70)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    color: SVColors.sv_main_violet,
                    transform: Matrix4.translationValues(0, -10, 0),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        transform: Matrix4.translationValues(0, 0, 0),
                        child: TaskListItem(
                          title: "February 2 22323",
                          id1: "454546564",
                          id2: 'ssdaa45455',
                          id3: 'a1554554',
                          id4: '55888787',
                          isCompleted: true,
                        ),
                        width: double.infinity,
                      ),
                    ],
                  )
                ],
              );
            }, childCount: 1),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Column(
                    children: <Widget>[
                      TaskListItem(
                        title: "January 7 22323",
                        id1: "454546564",
                        id2: 'ssdaa45455',
                        id3: 'a1554554',
                        id4: '55888787',
                        isCompleted: true,
                        viewmodel: vm,
                      ),
                    ],
                  );
                },
                childCount: 20,
              ))
        ],
      ),
    );
  }
}

class _ViewModel {
  final Function navigationToDetailsPageAction;

  _ViewModel({this.navigationToDetailsPageAction});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      navigationToDetailsPageAction: () {
        store.dispatch(NavigateToDetailsPageAction());
      },
    );
  }
}
