import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  final Widget child;

  const TabletLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/logo/logo.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "D to D",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/alarm.png"),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/search.png"),
            iconSize: 19,
          )
        ],
      ),
      body: child,
    );
  }
}
