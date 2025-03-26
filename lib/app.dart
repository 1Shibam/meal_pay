import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_pay/routes/router_config.dart';

class MealPayApp extends StatelessWidget {
  const MealPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter,
        );
      },
    );
  }
}
