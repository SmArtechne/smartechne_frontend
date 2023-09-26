import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'detail_page.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    '2층',
    '4층',
    '5층',
    '7층' // 필요한 만큼 아이템을 추가할 수 있습니다.
  ];

  String dropdownValue = 'AI 공학관';

  List<String> spinnerItems = ['AI 공학관', '비전타워', '가천관', '글로벌센터', '교육대학원'];

  int pressedAttentionIndex = -1;

  Container _tile(BuildContext context, String title, String low, String high,
          int degree, int color) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 5.0),
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
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            color: Color(0xFF3F8AE2),
            child: Text(
              '아르테크네',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0), // Add horizontal and vertical padding
          child: Text(
            '건물',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // 테두리 색상 설정
                width: 1.5, // 테두리 너비 설정
              ),
              borderRadius: BorderRadius.circular(16.0), // 테두리를 둥글게 설정
            ),
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,

              icon: Padding(
                  //Icon at tail, arrow bottom is default icon
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.arrow_drop_down)), // 아이콘 지정
              elevation: 0,
              style: TextStyle(color: Colors.black, fontSize: 18),
              onChanged: (String? data) {
                setState(() {
                  dropdownValue = data!;
                });
              },
              underline: SizedBox.shrink(),
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0), // 텍스트 상하 여백 조절
                    child: Text(value, textAlign: TextAlign.center),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 24.0), // Add horizontal and vertical padding
            child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection:
                      Axis.horizontal, // Set the scroll direction to horizontal
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 10,
                  ), //separatorBuilder : item과 item 사이에 그려질 위젯 (개수는 itemCount -1 이 된다)

                  itemCount: items.length != null ? items.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final pressAttention = pressedAttentionIndex == index;

                    return Container(
                      margin: index == 0
                          ? const EdgeInsets.only(left: 20.0)
                          : index == items.length - 1
                              ? const EdgeInsets.only(right: 20.0)
                              : const EdgeInsets.only(right: 0.0),
                      child: TextButton(
                        onPressed: () =>
                            setState(() => pressedAttentionIndex = index),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(90, 0)), // 너비를 설정
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 20.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            pressAttention
                                ? Color(0xFF3F8AE2)
                                : Colors.white, // 클릭 상태에 따라 색상 변경
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: pressAttention
                                      ? Color(0xFF3F8AE2)
                                      : Colors.grey.shade400,
                                  width: 3),
                              borderRadius: BorderRadius.circular(
                                  12.0), // 테두리를 둥근 테두리로 설정
                            ),
                          ),
                        ),
                        child: Text(
                          '${items[index]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: pressAttention ? Colors.white : Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ))),
        const Divider(
          color: Colors.black, // Set the color of the divider
          thickness: 0.8, // Set the thickness of the divider
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0), // Add horizontal and vertical padding
          child: Text(
            dropdownValue +
                (pressedAttentionIndex >= 0
                    ? ' ${items[pressedAttentionIndex]}'
                    : ''), // pressedAttentionIndex가 -1이 아닌 경우에만 추가
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 40.0),
            child: BottomButton(),
          ),
        )
      ],
    );
  }

  ElevatedButton BottomButton() {
    return ElevatedButton(
      onPressed: () => context.go('/detail'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 15.0, horizontal: 94.0)),
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xB0FF9900)), // 배경색을 노란색으로 설정
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // 테두리를 둥근 테두리로 설정
          ),
        ),
      ),
      child: Text(
        '실시간 자리현황',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
