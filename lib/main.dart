import 'package:flutter/material.dart';
import 'package:smartechne_frontend/layout.dart';
import 'package:smartechne_frontend/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: const Layout(),
    // );
    return MaterialApp.router(
      title: 'DtoD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      // home: Login(),
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
