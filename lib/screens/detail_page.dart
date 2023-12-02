import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Widget _tile(BuildContext context, String title, String low, String high,
          int degree, int color){
                    String content = title == '온도' ? '$degree도' : '$degree%';
                    double convertPercent = title == '온도' ? (degree-10).toDouble()/30 : degree.toDouble()/100;



          // 배경 검은색
      return Container(
        
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical:8.0),
        width: MediaQuery.of(context).size.width/2 * 0.7,
       
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
                )),
              SizedBox(height: 8.0), // 상하 여백 추가
            CircularPercentIndicator(
              //부모 가로만큼의 반지름
              radius: MediaQuery.of(context).size.width/4 * 0.6,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent: convertPercent,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color(color),
                center: new Text(
                  content,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
            ),
          ],
        ),
      );
          }

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
              vertical: 0.0), // Add horizontal and vertical padding
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  _tile(context, '복잡도', '낮음', '높음', 75, 0xFF3F8AE2),
                  _tile(context, '소음', '낮음', '높음', 25, 0xFF5252C9),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  _tile(context, '온도', '0도', '40도', 23, 0xFFFF7063),
                  _tile(context, '습도', '건조', '습함', 65, 0xFF80E253),
              ],)

            ],
          ),
        ),
      ],
    );
  }
}
