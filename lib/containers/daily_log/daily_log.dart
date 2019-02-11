import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      style: const TextStyle(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w600,
          fontFamily: "OpenSans",
          fontStyle: FontStyle.normal,
          fontSize: 15.0));

  Widget searchView(BuildContext context) => Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: SVColors.sv_main_violet,
          title: title(),
          pinned: true,
          floating: true,
          bottom: PreferredSize(
              child: searchView(context), preferredSize: Size(95.5, 60)),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Text('sadsdasd');
        }, childCount: 50))
      ],
    );
  }
}
