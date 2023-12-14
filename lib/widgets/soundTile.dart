import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SoundTile extends StatefulWidget {
  final BuildContext context;
  final String title;
  final String low;
  final String high;
  final int degree;
  final int color;

  SoundTile({
    required this.context,
    required this.title,
    required this.low,
    required this.high,
    required this.degree,
    required this.color,
  });

  @override
  _SoundTileState createState() => _SoundTileState();
}

class _SoundTileState extends State<SoundTile> {
  bool isExpanded = false;
  Color containerColor = Colors.white; // Container 색을 저장할 변수
  Color iconColor = Colors.blue; // 아이콘 색을 저장할 변수
  double size = 0;

  @override
  Widget build(BuildContext context) {
    IconData iconData = CupertinoIcons.speaker;

    // 소음 수준에 따라 아이콘 변경
    if (widget.degree < 25) {
      iconData = CupertinoIcons.speaker;
    } else if (widget.degree >= 25 && widget.degree < 50) {
      iconData = CupertinoIcons.speaker_1;
    } else if (widget.degree >= 50 && widget.degree < 75) {
      iconData = CupertinoIcons.speaker_2;
    } else {
      iconData = CupertinoIcons.speaker_3;
    }

    String expandedTitle = '';
    String title = '소음';
    String comment0 = '20dB : 시계 초침 소리';
    String comment1 = '40dB : 도서관 소리';
    String comment2 = '50dB : 조용한 사무실';
    String comment3 = '50~70dB : 백색소음';
    String comment4 = '80dB : 지하철 차내 소리';

    int comment = 0;
    // 소음 수준에 따라 아이콘 변경
    if (widget.degree < 21) {
      expandedTitle = '시계 초침 소리';
      comment = 0;
    } else if (widget.degree >= 21 && widget.degree < 40) {
      expandedTitle = '도서관 소리';
      comment = 1;
    } else if (widget.degree >= 40 && widget.degree < 50) {
      expandedTitle = '조용한 사무실';
      comment = 2;
    } else if (widget.degree >= 50 && widget.degree <= 70) {
      expandedTitle = '백색소음';
      comment = 3;
    } else if (widget.degree > 70 && widget.degree <= 80) {
      expandedTitle = '지하철 차내 소리';
      comment = 4;
    } else if (widget.degree > 80) {
      expandedTitle = '매우 시끄러움';
      comment = 4;
    }

    if (isExpanded) {
      // isExpanded가 true일 때만 색상을 color 변수의 투명도80으로 하고 싶어

      containerColor = Colors.grey.shade200;
      iconColor = Colors.grey.shade300;
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = expandedTitle;
    } else {
      containerColor = Colors.transparent;
      iconColor = Color(widget.color);
      size = MediaQuery.of(widget.context).size.width / 4 * 1.2;
      title = widget.degree.toString() + 'dB';
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
                SizedBox(height: 8.0), // 상하 여백 추가
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
