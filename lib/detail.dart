import 'package:flutter/material.dart';
import 'package:smartechne_frontend/screens/detail_page.dart';

class DetailLayout extends StatelessWidget {
  const DetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SmArtehcne'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
