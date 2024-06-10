import 'package:flutter/material.dart';
import 'package:smartechne_frontend/screens/home_page.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'SmArtechne',
              style: TextStyle(
                fontFamily: 'Roboto', // 원하는 글꼴 설정
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true, // 제목을 중앙에 배치
        backgroundColor: Colors.blueAccent, // AppBar 배경 색상 변경
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(),
        child: Home(),
      )),
    );
  }
}
