import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TemperatureTile extends StatefulWidget {
  final BuildContext context;
  final String title;
  final String low;
  final String high;
  final int degree;
  final int color;

  TemperatureTile({
    required this.context,
    required this.title,
    required this.low,
    required this.high,
    required this.degree,
    required this.color,
  });

  @override
  _TemperatureTileState createState() => _TemperatureTileState();
}

class _TemperatureTileState extends State<TemperatureTile> {
  bool isExpanded = false;
  Color containerColor = Colors.white; // Container 색을 저장할 변수
  Color iconColor = Colors.blue; // 아이콘 색을 저장할 변수
  double size = 0;
  String title = '온도';
  String comment = '18°C : 불편함\n21°C : 적당함\n24°C : 쾌적함\n27°C : 적당함\n30°C : 불편함';

  @override
  Widget build(BuildContext context) {
    IconData iconData = CupertinoIcons.thermometer;

    String comment0 = '30°C 이상 : 더움';
    String comment1 = '27°C : 약간 더움';
    String comment2 = '24°C : 쾌적함';
    String comment3 = '21°C : 약간 추움';
    String comment4 = '18°C 이하 : 추움';
    int comment = 0;
    String expandedTitle = '';

    // 온도에 따라 아이콘 변경
    if (widget.degree < 18) {
      comment = 4;
      expandedTitle = '추움';
    } else if (widget.degree >= 18 && widget.degree < 21) {
      comment = 3;
      expandedTitle = '약간 추움';
    } else if (widget.degree >= 21 && widget.degree < 24) {
      comment = 2;
      expandedTitle = '쾌적함';
    } else if (widget.degree >= 24 && widget.degree < 27) {
      comment = 1;
      expandedTitle = '약간 더움';
    } else if (widget.degree >= 27) {
      comment = 0;
      expandedTitle = '더움';
    }
    if (isExpanded) {
      // isExpanded가 true일 때만 색상을 color 변수의 투명도80으로 하고 싶어

      containerColor = Colors.grey.shade200;
      iconColor = Colors.grey.shade300.withOpacity(1);
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = expandedTitle;
    } else {
      containerColor = Colors.transparent;
      iconColor = Color(widget.color);
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = widget.degree.toString() + '°C';
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
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.5),
              color: containerColor,
            ),
            width: MediaQuery.of(context).size.width / 2 * 0.85,
            height: MediaQuery.of(context).size.width / 2 * 0.85,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 8.0),
                Stack(children: [
                  // 상하 여백 추가
                  Icon(
                    iconData,
                    size: size,
                    color: iconColor, // 아이콘 색상
                  ),
                  if (isExpanded)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment0,
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: comment == 0
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment1,
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: comment == 1
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment2,
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: comment == 2
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment3,
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: comment == 3
                                ? Colors.black
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          comment4,
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
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
