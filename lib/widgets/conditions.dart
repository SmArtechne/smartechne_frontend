import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Container _tile(BuildContext context, String title, String low, String high,
        int degree, int color) =>
    Container(
      child: Column(
        children: [
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          LinearPercentIndicator(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            percent: degree / 100,
            lineHeight: 20.0,
            backgroundColor: Colors.grey,
            progressColor: Color(color),
            width: MediaQuery.of(context).size.width - 32,
          )
        ],
      ),
    );
