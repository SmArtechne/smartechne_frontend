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
  final String space;
  final int humidityDegree;
  final int temperatureDegree;
  final int soundDegree;

  Detail({
    required this.context,
    required this.seats,
    required this.loading,
    required this.remainSeats,
    required this.totalSeats,
    required this.space,
    required this.humidityDegree,
    required this.temperatureDegree,
    required this.soundDegree,
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
              size: MediaQuery.of(context).size.height / 4 * 0.12,
            )
          : Icon(
              CustomIcons.event_seat,
              color: disable,
              size: MediaQuery.of(context).size.height / 4 * 0.12,
            ),
      SizedBox(
        height: gap,
      ),
    ]);
  }

  Widget _desk() {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 4 * 0.12,
        width: MediaQuery.of(context).size.height / 4 * 0.12,
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
      leftSeatWidgets.add(_seats(seats[index + i] == 0,
          MediaQuery.of(context).size.height / 4 * 0.02));
      if (seats[index + i] == 0) {}
      rightSeatWidgets.add(_seats(seats[index + i + 7] == 0,
          MediaQuery.of(context).size.height / 4 * 0.02));
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
              height: MediaQuery.of(context).size.height / 4 * 1,
              width: MediaQuery.of(context).size.height / 4 * 0.12,
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
      sideSeatWidgets.add(_seats(seats[index + i] == 0,
          MediaQuery.of(context).size.height / 4 * 0.01));
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
          _seats(seats[index + 1] == 0,
              MediaQuery.of(context).size.height / 4 * 0.01),
          _seats(seats[index + 0] == 0, 0),
        ]),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4 * 0.12,
              width: MediaQuery.of(context).size.height / 4 * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), color: desk),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4 * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4 * 0.12,
              width: MediaQuery.of(context).size.height / 4 * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), color: desk),
            ),
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Column(children: [
          _seats(seats[index + 9] == 0,
              MediaQuery.of(context).size.height / 4 * 0.01),
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
          _seats(seats[index + 1] == 0,
              MediaQuery.of(context).size.height / 4 * 0.0005),
          _seats(seats[index + 0] == 0, 0),
        ]),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4 * 0.12 * 2,
              width: MediaQuery.of(context).size.height / 4 * 0.12,
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
        height: MediaQuery.of(context).size.height * 0.72,
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns children to the left

            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 4 * 0.04, 0, 0),
                child: Column(children: [
                  Text(
                    widget.space,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 4 * 0.1,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      CustomIcons.thermometer_half,
                      color: Colors.red,
                      size: MediaQuery.of(context).size.height / 4 * 0.1,
                    ),
                    Text(
                      widget.temperatureDegree.toString() + '°C',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 4 * 0.08,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.drop_fill,
                      color: Colors.blue,
                      size: MediaQuery.of(context).size.height / 4 * 0.1,
                    ),
                    Text(
                      widget.humidityDegree.toString() + '%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 4 * 0.08,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.volume_down,
                      size: MediaQuery.of(context).size.height / 4 * 0.1,
                    ),
                    Text(
                      widget.soundDegree.toString() + 'dB',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 4 * 0.08,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    widget.loading == true
                        ? Container(
                            width: 20,
                            height: 20,
                            padding: EdgeInsets.all(3),
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          )
                        : Icon(
                            CupertinoIcons.check_mark_circled_solid,
                            color: Colors.green,
                            size: 20,
                          )
                  ]),
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0), // Add horizontal and vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4 * 1.6,
                      width: 22,
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'L',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
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
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4 * 1.6,
                      width: 22,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'R',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.event_seat,
                        color: Colors.blue,
                        size: MediaQuery.of(context).size.height / 4 * 0.22,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '사용가능',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height / 4 * 0.08,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.remainSeats.toString() + '석',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height / 4 * 0.1,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4 * 0.08,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.event_seat,
                        color: Colors.grey.shade400,
                        size: MediaQuery.of(context).size.height / 4 * 0.22,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '사용불가',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height / 4 * 0.08,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (widget.totalSeats - widget.remainSeats).toString() +
                            '석',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height / 4 * 0.1,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4 * 0.08,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
