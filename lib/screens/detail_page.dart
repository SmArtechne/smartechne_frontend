import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:smartechne_frontend/custom_icons.dart';
import 'package:smartechne_frontend/widgets/centerseats.dart';

class Detail extends StatefulWidget {
  final BuildContext context;
  final List<int> seats;
  final bool loading;
  final int remainSeats;
  final int totalSeats;

  Detail({
    required this.context,
    required this.seats,
    required this.loading,
    required this.remainSeats,
    required this.totalSeats,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double size = 30;
  Color disable = Colors.grey.shade400;
  Color able = Colors.blue;
  Color desk = Colors.grey.shade300;

  Widget _seats(bool isAble, double gap) {
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
        height: gap,
      ),
    ]);
  }

  Widget _desk() {
    return Column(children: [
      Container(
        height: 70,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: desk),
      ),
    ]);
  }

  Widget _centerseats(BuildContext context, List<int> seats, int index) {
    List<Widget> leftSeatWidgets = [];
    List<Widget> rightSeatWidgets = [];

    leftSeatWidgets.add(SizedBox(height: 15));
    rightSeatWidgets.add(SizedBox(height: 15));

    for (int i = 6; i >= 0; i--) {
      leftSeatWidgets.add(_seats(seats[index + i] == 0, 15));
      if (seats[index + i] == 0) {}
      rightSeatWidgets.add(_seats(seats[index + i + 7] == 0, 15));
    }
    // 배경 검은색
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
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

  Widget _sideseats(BuildContext context, List<int> seats, int index) {
    List<Widget> sideSeatWidgets = [];
    List<Widget> deskWidgets = [];

    sideSeatWidgets.add(SizedBox(height: 15));

    for (int i = 9; i >= 0; i--) {
      sideSeatWidgets.add(_seats(seats[index + i] == 0, 6.5));
    }

    for (int i = 0; i < 5; i++) {
      deskWidgets.add(_desk());
      if (i != 4) {
        deskWidgets.add(SizedBox(
          height: 5,
        ));
      }
    }

    // 배경 검은색
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width / 3 * 0.9,
      child: Row(children: [
        Column(children: sideSeatWidgets),
        SizedBox(
          width: 5,
        ),
        Column(
          children: deskWidgets,
        ),
      ]),
    );
  }

  Widget _4seats(BuildContext context, List<int> seats, int index) {
    // 배경 검은색
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Row(children: [
        Column(children: [
          _seats(seats[index + 1] == 0, 10),
          _seats(seats[index + 0] == 0, 0),
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
          _seats(seats[index + 9] == 0, 10),
          _seats(seats[index + 8] == 0, 0),
        ])
      ]),
    );
  }

  Widget _2seats(BuildContext context, List<int> seats, int index) {
    // 배경 검은색
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
      child: Row(children: [
        Column(children: [
          _seats(seats[index + 1] == 0, 2),
          _seats(seats[index + 0] == 0, 0),
        ]),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Container(
              height: 60,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), color: desk),
            ),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the left

          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0), // Add horizontal and vertical padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      _centerseats(context, widget.seats, 16)
                    ],
                  ),
                  Column(
                    children: [
                      _2seats(context, widget.seats, 40),
                      _2seats(context, widget.seats, 38),
                      _2seats(context, widget.seats, 36),
                      _2seats(context, widget.seats, 34),
                      _2seats(context, widget.seats, 32),
                      _2seats(context, widget.seats, 30)
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            //   child: Text(
            //     '한가함',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //       color: Colors.white,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      CustomIcons.event_seat,
                      color: Colors.blue,
                      size: 50,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '사용가능',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.remainSeats.toString() + '석',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 42,
                    )
                  ],
                ),
                widget.loading == true
                    ? Container(
                        margin:
                            EdgeInsets.only(left: 30, right: 30, bottom: 25),
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      )
                    : SizedBox(
                        width: 82,
                      ),
                Column(
                  children: [
                    Icon(
                      CustomIcons.event_seat,
                      color: Colors.grey.shade400,
                      size: 50,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '사용불가',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (widget.totalSeats - widget.remainSeats).toString() + '석',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 42,
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
