import 'package:flutter/material.dart';
import 'package:sewer_vewier/containers/daily_log/daily_log.dart';
import 'package:sewer_vewier/containers/projects/projects_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final Key keyOne = PageStorageKey('dailyLog');
  final Key keyTwo = PageStorageKey('projects');

  Widget currentPage({index: int}) {
    if (index == 0) {
      return DailyLogView(
        key: keyOne,
      );
    } else if (index == 1) {
      return ProjectView(
        key: keyTwo,
      );
    } else {
      return Container(
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: title(),
//          elevation: 0.0,
//          backgroundColor: SVColors.sv_main_violet,
//          actions: <Widget>[
//            IconButton(icon: Icon(Icons.add), onPressed: () {})
//          ],
//        ),
        body: PageStorage(
            bucket: bucket, child: currentPage(index: currentIndex)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          fixedColor: Color(0xff284dbe),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              title: Text("Daily Log"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.store),
                title: Text(
                  "Projects",
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.store), title: Text("Queue")),
            BottomNavigationBarItem(
                icon: Icon(Icons.store), title: Text("Logout"))
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
