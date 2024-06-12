import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ComplexityTile extends StatefulWidget {
  final BuildContext context;
  final String title;
  final String low;
  final String high;
  final int seated;
  final int total;
  final int color;

  ComplexityTile({
    required this.context,
    required this.title,
    required this.low,
    required this.high,
    required this.seated,
    required this.total,
    required this.color,
  });

  @override
  _ComplexityTileState createState() => _ComplexityTileState();
}

class _ComplexityTileState extends State<ComplexityTile> {
  bool isExpanded = false;
  Color containerColor = Colors.white; // Container 색을 저장할 변수
  Color pbColor = Colors.black; // 아이콘 색을 저장할 변수
  Color bgColor = Colors.grey.shade200;
  double size = 0;
  String title = '사용 좌석';
  double percent = 0;

  @override
  Widget build(BuildContext context) {
    IconData iconData = CupertinoIcons.speaker;
    String categoryDegree = "쾌적";
    String expandedTitle = '';
    String degree = (widget.total - widget.seated).toString() +
        "/" +
        widget.total.toString();

    percent = (widget.total - widget.seated) / widget.total * 100;

    String comment0 = '80% 이상 : 매우 한가함';
    String comment1 = '60~80% : 한가함';
    String comment2 = '40~60% : 적당함';
    String comment3 = '30~40% : 복잡함';
    String comment4 = '30% 이하 : 매우 복잡함';
    int comment = 0;

    double fontSize = MediaQuery.of(context).size.height / 4 * 0.070;
    double fontHeight = MediaQuery.of(context).size.height / 4 * 0.0065;

    if (percent < 20) {
      pbColor = Colors.blue;
      categoryDegree = "매우 한가함";
      comment = 4;
    } else if (percent >= 20 && percent < 40) {
      pbColor = Colors.green;
      categoryDegree = "한가함";
      comment = 3;
    } else if (percent >= 40 && percent < 60) {
      pbColor = Colors.yellow;
      categoryDegree = "적당함";
      comment = 2;
    } else if (percent >= 60 && percent < 80) {
      pbColor = Colors.orange;
      categoryDegree = "복잡함";
      comment = 1;
    } else if (percent >= 80 && percent <= 100) {
      pbColor = Colors.red;
      categoryDegree = "매우 복잡함";
      comment = 0;
    }

    // if (percent < 20) {
    //   pbColor = Colors.red;
    //   categoryDegree = "매우 복잡함";
    //   comment = 4;
    // } else if (percent >= 20 && percent < 40) {
    //   pbColor = Colors.orange;
    //   categoryDegree = "복잡함";
    //   comment = 3;
    // } else if (percent >= 40 && percent < 60) {
    //   pbColor = Colors.yellow.shade600;
    //   categoryDegree = "적당함";
    //   comment = 2;
    // } else if (percent >= 60 && percent < 80) {
    //   pbColor = Colors.green;
    //   categoryDegree = "한가함";
    //   comment = 1;
    // } else if (percent >= 80 && percent <= 100) {
    //   pbColor = Colors.blue;
    //   categoryDegree = "매우 한가함";
    //   comment = 0;
    // }

    if (isExpanded) {
      // isExpanded가 true일 때만 색상을 color 변수의 투명도80으로 하고 싶어

      containerColor = Colors.grey.shade200;
      bgColor = Colors.grey.shade100.withOpacity(1);
      pbColor = Colors.grey.shade300.withOpacity(1);
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = categoryDegree;
      degree = '';
    } else {
      containerColor = Colors.transparent;
      bgColor = Colors.grey.shade200;
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = widget.title;
      degree = (widget.total - widget.seated).toString() +
          "/" +
          widget.total.toString();
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
                SizedBox(height: 8),
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

                      percent: percent / 100,
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
