import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:smartechne_frontend/custom_icons.dart';
import 'package:smartechne_frontend/widgets/centerseats.dart';

class Detail extends StatefulWidget {
  final BuildContext context;
  final List<int> seats;

  Detail({
    required this.context,
    required this.seats,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
        height: 20,
      ),
    ]);
  }

  Widget _centerseats(BuildContext context, List<int> seats, int index) {
    List<Widget> leftSeatWidgets = [];
    List<Widget> rightSeatWidgets = [];

    for (int i = 6; i >= 0; i--) {
      leftSeatWidgets.add(_seats(seats[index + i] == 0));
      if (seats[index + i] == 0) {
        print(index + i);
      }
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
              height: 300,
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

  Widget _4seats(BuildContext context, List<int> seats, int index) {
    // 배경 검은색
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width / 3 * 0.9,
      child: Row(children: [
        Column(children: [
          seats[index + 1] == 0
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
          seats[index + 0] == 0
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
        ]),
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
            SizedBox(
              height: 5,
            ),
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
        Column(children: [
          seats[index + 9] == 0
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
          seats[index + 8] == 0
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
        ])
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white, // Set background color
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the left

          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0), // Add horizontal and vertical padding
              child: Row(
                children: [
                  Column(
                    children: [
                      _4seats(context, widget.seats, 6),
                      _4seats(context, widget.seats, 4),
                      _4seats(context, widget.seats, 2),
                      _4seats(context, widget.seats, 0)
                    ],
                  ),
                  Column(
                    children: [_centerseats(context, widget.seats, 16)],
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
