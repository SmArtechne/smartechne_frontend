import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Container _tile(BuildContext context, String title, String low, String high,
          int degree, int color) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 0.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                )),
            LinearPercentIndicator(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              percent: degree / 100,
              lineHeight: 23.0,
              backgroundColor: Color(0xFFE9E9E9),
              progressColor: Color(color),
              width: MediaQuery.of(context).size.width - 88, // 또는 원하는 비율로 조정
            ),
            SizedBox(height: 8.0), // 상하 여백 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(low,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    )),
                Text(high,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    )),
              ],
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns children to the left

      children: [
        const Divider(
          color: Colors.black, // Set the color of the divider
          thickness: 0.8, // Set the thickness of the divider
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0), // Add horizontal and vertical padding
          child: Column(
            children: [
              _tile(context, '복잡도', '낮음', '높음', 75, 0xFF3F8AE2),
              _tile(context, '소음', '낮음', '높음', 75, 0xFFC644C9),
              _tile(context, '온도', '0도', '40도', 75, 0xFFF41A1A),
              _tile(context, '습도', '건조', '습함', 75, 0xFF3FE263),
            ],
          ),
        ),
      ],
    );
  }
}
