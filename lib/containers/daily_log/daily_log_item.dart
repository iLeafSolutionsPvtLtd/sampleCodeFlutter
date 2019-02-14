import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sewer_vewier/sv_colors.dart';

class TaskListItem extends StatelessWidget {
  // variable names are for test purpose only
  final String title;
  final String id1;
  final String id2;
  final String id3;
  final String id4;
  final isCompleted;

  const TaskListItem(
      {Key key,
      this.title,
      this.id1,
      this.id2,
      this.id3,
      this.id4,
      this.isCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: SVColors.sv_light_gray)),
      height: 120,
      margin: EdgeInsets.only(left: 4, right: 4, bottom: 0.5),
      transform: Matrix4.translationValues(0, -40, 0),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: RawMaterialButton(
                onPressed: () {
                  print('pressed');
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ImageIcon(
                              AssetImage('assets/loactionRed.png'),
                              color: Colors.green,
                              size: 14.2,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(title,
                                    style: const TextStyle(
                                        color: const Color(0xff010101),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "GoogleSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.7)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Container(
                            color: SVColors.sv_light_gray,
                            height: 1.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.3),
                                  child: Image.asset(
                                    'assets/redRound.png',
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 17.0),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(id1,
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff686868),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "GoogleSans",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 11.7)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  size: 14.7,
                                                ),
                                              ),
                                              Text(id2,
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff686868),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "GoogleSans",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 11.7)),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(id3,
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0xffc5c5c5),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "GoogleSans",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 11.7)),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0),
                                                      child: Container(
                                                        height: 23.0,
                                                        width: 78,
                                                        transform: Matrix4
                                                            .translationValues(
                                                                0, -5.0, 0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: SVColors
                                                                .sv_red),
                                                        child: Center(
                                                          child: Text(id4,
                                                              style: const TextStyle(
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily:
                                                                      "GoogleSans",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      11.7)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
