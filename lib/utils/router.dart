import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartechne_frontend/layout.dart';
import 'package:smartechne_frontend/detail.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Layout(),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) => const DetailLayout(),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
