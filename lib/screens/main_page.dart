import 'package:d_to_d/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/layout/mobile_layout.dart';
// import 'package:d_to_d/widgets/layout/tablet_layout.dart';
import 'package:d_to_d/widgets/layout/desktop_layout.dart';

class MainPage extends StatelessWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  // static bool isDesktop1(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 1000;

  // static bool isDesktop2(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 1000;

  // static bool isDesktop2(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ResponsiveLayout(
              mobileBody: MobileLayout(
                child: child,
              ),
              // tabletBody: TabletLayout(
              //   child: child,
              // ),
              desktopBody: DesktopLayout(
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
