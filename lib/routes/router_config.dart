import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/screens/splash_screen.dart';

GoRouter appRouter = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
    path: '/splash',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const SplashScreen(),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    },
  )
]);
