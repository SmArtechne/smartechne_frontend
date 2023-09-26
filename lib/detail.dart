import 'package:flutter/material.dart';
import 'package:smartechne_frontend/screens/detail_page.dart';

class DetailLayout extends StatelessWidget {
  const DetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아르테크네'),
      ),
      body: SingleChildScrollView(
        child: Detail(),
      ),
    );
  }
}
