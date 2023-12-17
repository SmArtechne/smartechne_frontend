import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HumidityTile extends StatefulWidget {
  final BuildContext context;
  final String title;
  final String low;
  final String high;
  final int degree;
  final int color;

  HumidityTile({
    required this.context,
    required this.title,
    required this.low,
    required this.high,
    required this.degree,
    required this.color,
  });

  @override
  _HumidityTileState createState() => _HumidityTileState();
}

class _HumidityTileState extends State<HumidityTile> {
  bool isExpanded = false;
  Color containerColor = Colors.white; // Container 색을 저장할 변수
  Color pbColor = Colors.blue; // 아이콘 색을 저장할 변수
  Color bgColor = Colors.grey.shade200;
  double size = 0;

  String degree = '';
  @override
  Widget build(BuildContext context) {
    IconData iconData = CupertinoIcons.speaker;
    String categoryDegree = "쾌적함";
    String expandedTitle = '';
    String title = '습도';
    String comment0 = '80% 이상 : 습함';
    String comment1 = '60~80% : 약간 습함';
    String comment2 = '40~60% : 쾌적함';
    String comment3 = '30~40% : 다소 건조함';
    String comment4 = '30% 이하 : 건조함';
    int comment = 0;

    double fontSize = MediaQuery.of(context).size.height / 4 * 0.07;
    double fontHeight = MediaQuery.of(context).size.height / 4 * 0.0065;

    // 습도 수준에 따라 아이콘 comment 변경
    if (widget.degree >= 80) {
      pbColor = Colors.blue.shade900;
      comment = 0;
    } else if (widget.degree >= 60 && widget.degree < 80) {
      pbColor = Colors.blue.shade700;

      comment = 1;
    } else if (widget.degree >= 40 && widget.degree < 60) {
      pbColor = Colors.blue.shade500;

      comment = 2;
    } else if (widget.degree >= 30 && widget.degree < 40) {
      pbColor = Colors.blue.shade300;

      comment = 3;
    } else {
      pbColor = Colors.blue.shade100;

      comment = 4;
    }

    if (isExpanded) {
      // isExpanded가 true일 때만 색상을 color 변수의 투명도80으로 하고 싶어
      containerColor = Colors.grey.shade200;
      bgColor = Colors.grey.shade100;
      pbColor = Colors.grey.shade300.withOpacity(1);
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = categoryDegree;
      degree = '';
      expandedTitle = '';
    } else {
      containerColor = Colors.transparent;
      bgColor = Colors.grey.shade200;
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      degree = widget.degree.toString() + '%';
      title = widget.title;
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.5),
              color: containerColor,
            ),
            width: MediaQuery.of(context).size.height / 2 * 0.4,
            height: MediaQuery.of(context).size.height / 2 * 0.4,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 4 * 0.18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Stack(children: [
                  // 상하 여백 추가
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    alignment: Alignment.center,
                    child: CircularPercentIndicator(
                      //부모 가로만큼의 반지름
                      radius: MediaQuery.of(context).size.height / 4 * 0.27,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: MediaQuery.of(context).size.height / 4 * 0.06,
                      percent: widget.degree / 100,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: pbColor,
                      backgroundColor: bgColor,
                      center: new Text(
                        degree,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height / 4 * 0.1,
                        ),
                      ),
                    ),
                  ),
                  if (isExpanded)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.width / 4 * 0.02),
                        Text(
                          comment0,
                          style: TextStyle(
                            height: fontHeight,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: comment == 0
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment1,
                          style: TextStyle(
                            height: fontHeight,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: comment == 1
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment2,
                          style: TextStyle(
                            height: fontHeight,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: comment == 2
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment3,
                          style: TextStyle(
                            height: fontHeight,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: comment == 3
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment4,
                          style: TextStyle(
                            height: fontHeight,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: comment == 4
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
