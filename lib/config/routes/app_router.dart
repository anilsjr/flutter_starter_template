import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../src/view/screens/main_wrapper.dart';

class AppRouter {
  static const String home = '/';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const MainWrapper(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page not found')),
    ),
  );
}
