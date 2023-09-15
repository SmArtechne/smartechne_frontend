import 'package:flutter/material.dart';
import 'package:smartechne_frontend/screens/home_page.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아르테크네'),
      ),
      body: SingleChildScrollView(
        child: Home(),
      ),
    );
  }
}
