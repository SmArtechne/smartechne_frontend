import 'package:flutter/material.dart';
import 'package:smartechne_frontend/custom_icons.dart';

Widget _centerseats(BuildContext context, List<int> seats, int index) {
  double size = 30;
  Color disable = Colors.grey.shade400;
  Color able = Colors.blue;
  Color desk = Colors.grey.shade300;

  Widget _seats(bool isAble) {
    return Column(children: [
      isAble
          ? Icon(
              CustomIcons.event_seat,
              color: able,
              size: size,
            )
          : Icon(
              CustomIcons.event_seat,
              color: disable,
              size: size,
            ),
      SizedBox(
        height: 10,
      ),
    ]);
  }

  List<Widget> leftSeatWidgets = [];
  List<Widget> rightSeatWidgets = [];

  for (int i = 0; i < 7; i++) {
    leftSeatWidgets.add(_seats(seats[index + i] == 0));
    rightSeatWidgets.add(_seats(seats[index + i + 7] == 0));
  }
  // 배경 검은색
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
    width: MediaQuery.of(context).size.width / 3 * 0.9,
    child: Row(children: [
      Column(children: leftSeatWidgets),
      SizedBox(
        width: 5,
      ),
      Column(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: desk),
          ),
        ],
      ),
      SizedBox(
        width: 5,
      ),
      Column(children: rightSeatWidgets),
    ]),
  );
}
