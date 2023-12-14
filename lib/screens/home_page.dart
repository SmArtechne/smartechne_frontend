import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smartechne_frontend/widgets/complecityTile.dart';
import 'package:smartechne_frontend/widgets/humidityTile.dart';
import 'package:smartechne_frontend/widgets/soundTile.dart';
import 'package:smartechne_frontend/widgets/temperatureTile.dart';
import 'detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartechne_frontend/models/ApiResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Widget loadingIndicator({required BuildContext context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26.5),
      color: Colors.grey.shade200,
    ),
    width: MediaQuery.of(context).size.width / 2 * 0.85,
    height: MediaQuery.of(context).size.width / 2 * 0.85,
    child: Center(
      child: CircularProgressIndicator(), // 로딩 인디케이터 위젯
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  late Timer _commentTimer;
  bool detail = false;
  ApiResponse? apiResponse;

  //36 배열 0으로 초기화
  List<int> seats = List<int>.generate(36, (index) => 0);

  String dropdownValue = 'AI 공학관';
  String responseTime = '';
  bool loading = true;
  final loadingComment = [
    '제일 쾌적한 온습도 : 24°C 40%',
    '80dB은 창의력을 높여주기도 합니다',
    'AI공학관 아르테크네는 조용히',
    '데이터를 받고 있습니다',
    '잠시만 기다려주세요',
    '30초마다 데이터를 부릅니다'
  ];
  int commentIndex = 0;

  @override
  void initState() {
    super.initState();
// 앱이 시작되면 30초마다 API를 호출하도록 타이머를 설정합니다.
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      // API 호출 함수 호출
      setState(() {
        loading = true;
      });
      fetchData();
    });
    _commentTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        commentIndex = DateTime.now().second % 6;
      });
    });
  }

  @override
  void dispose() {
    // 위젯이 dispose될 때 타이머를 해제합니다.
    _timer.cancel();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = Uri.parse('http://54.180.0.181:5000/test');
      var response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        // ApiResponse 모델을 사용하여 JSON 데이터를 변환
        setState(() {
          loading = false;
          apiResponse = ApiResponse.fromJson(jsonData);
          // 현재 시간을 날짜 시간 형식으로 responseTime 변수에 저장
          responseTime = DateTime.now().toString();
          responseTime = responseTime.substring(10, 19);
          print(responseTime + ' ' + apiResponse!.remainSeat.toString());
          print(apiResponse!.result);

          seats = List<int>.generate(36, (index) => 0);

          apiResponse!.result.forEach((element) {
            seats[element] = 1;
          });
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<String> spinnerItems = ['AI 공학관', '비전타워', '가천관', '글로벌센터', '교육대학원'];

  // 각 건물에 맞는 층 수를 가지는 map

  Map<String, List<String>> floorMap = {
    'AI 공학관': ['2층', '4층', '5층', '7층'],
    '비전타워': ['4층', '5층', '6층'],
    '가천관': ['B1층', 'B2층', '2층', '3층', '4층', '5층'],
    '글로벌센터': ['1층', '2층', '3층', '4층', '5층'],
    '교육대학원': ['2층', '3층', '4층', '5층'],
  };

  int pressedAttentionIndex = 0;

  bool isExpanded = false; // 추가적인 컨텐츠가 보여지는지 여부를 나타내는 상태 변수

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns children to the left
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0), // Add horizontal and vertical padding
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
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 2.0),
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
                style: TextStyle(color: Colors.black, fontSize: 16),
                onChanged: (String? data) {
                  setState(() {
                    dropdownValue = data!;
                  });
                },
                underline: SizedBox.shrink(),
                items:
                    spinnerItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0), // 텍스트 상하 여백 조절
                      child: Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 12.0), // Add horizontal and vertical padding
              child: SizedBox(
                  height: 36,
                  child: ListView.separated(
                    scrollDirection: Axis
                        .horizontal, // Set the scroll direction to horizontal
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 10,
                    ), //separatorBuilder : item과 item 사이에 그려질 위젯 (개수는 itemCount -1 이 된다)

                    itemCount: floorMap[dropdownValue]?.length != null
                        ? floorMap[dropdownValue]!.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
                      final pressAttention = pressedAttentionIndex == index;

                      return Container(
                        margin: index == 0
                            ? const EdgeInsets.only(left: 20.0)
                            : index == floorMap[dropdownValue]!.length - 1
                                ? const EdgeInsets.only(right: 20.0)
                                : const EdgeInsets.only(right: 0.0),
                        child: TextButton(
                          onPressed: () =>
                              setState(() => pressedAttentionIndex = index),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(70, 0)), // 너비를 설정
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 16.0)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              pressAttention
                                  ? Color(0xFF3F8AE2)
                                  : Colors.grey.shade200,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                    color: pressAttention
                                        ? Color(0xFF3F8AE2)
                                        : Colors.grey.shade300,
                                    width: 2),
                                borderRadius: BorderRadius.circular(
                                    12.0), // 테두리를 둥근 테두리로 설정
                              ),
                            ),
                          ),
                          child: Text(
                            '${floorMap[dropdownValue]![index]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: pressAttention
                                  ? Colors.white
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ))),
          const Divider(
            color: Color(0xFFC7C7C7), // Set the color of the divider
            thickness: 1.5, // Set the thickness of the divider
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0), // Add horizontal and vertical padding
              child: Text(
                dropdownValue +
                    (pressedAttentionIndex >= 0
                        ? ' ${floorMap[dropdownValue]![pressedAttentionIndex]}'
                        : ''), // pressedAttentionIndex가 -1이 아닌 경우에만 추가
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(
            color: Color(0xFFC7C7C7), // Set the color of the divider
            thickness: 1.5, // Set the thickness of the divider
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading == false
                  ? Text(
                      "최근 업데이트 " + responseTime,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      loadingComment[commentIndex],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
              loading == true
                  ? Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 8.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 8.0), // Add horizontal and vertical padding
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    apiResponse == null
                        ? loadingIndicator(context: context)
                        : TemperatureTile(
                            context: context,
                            title: '온도',
                            low: '0도',
                            high: '40도',
                            degree: 23,
                            color: 0xFFFF7063),
                    apiResponse == null
                        ? loadingIndicator(context: context)
                        : SoundTile(
                            context: context,
                            title: '소음',
                            low: '낮음',
                            high: '높음',
                            degree: 100,
                            color: 0xFF5252C9),
                  ],
                ),
                SizedBox(height: 16.0), // 상하 여백 추가
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    apiResponse == null
                        ? loadingIndicator(context: context)
                        : ComplexityTile(
                            context: context,
                            title: '남은 좌석',
                            low: '낮음',
                            high: '높음',
                            seated: 6,
                            total: 36,
                            color: 0xFF3F8AE2),
                    apiResponse == null
                        ? loadingIndicator(context: context)
                        : HumidityTile(
                            context: context,
                            title: '습도',
                            low: '건조',
                            high: '습함',
                            degree: 2,
                            color: 0xFF80E253),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 40.0),
              child: BottomButton(),
            ),
          )
        ],
      ),
      detail == true ? Detail(context: context, seats: seats) : SizedBox()
    ]);
  }

  void detailOn() {
    detail = true;
  }

  ElevatedButton BottomButton() {
    return ElevatedButton(
      onPressed: () => detailOn(),
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
