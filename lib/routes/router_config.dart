import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/screens/home_screen.dart';
import 'package:meal_pay/screens/login_screen.dart';
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
  ),
  GoRoute(
    path: '/login',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const LoginScreen(),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: '/home',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const HomeScreen(),
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
