import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sewer_vewier/sv_colors.dart';

class ProjectListItem extends StatelessWidget {
  final String title;
  final double progress;

  const ProjectListItem({Key key, this.title, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('pressed');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        foregroundDecoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: SVColors.sv_light_gray))),
        height: 75,
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 0.5),
        transform: Matrix4.translationValues(0, -40, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(title,
                    maxLines: 1,
                    style: const TextStyle(
                        color: const Color(0xff404040),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GoogleSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.3)),
              ),
            ),
            Container(
              width: 75,
              child: Center(
                child: CircularProgressIndicator(
                  value: progress,
//            backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
