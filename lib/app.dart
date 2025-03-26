import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_pay/routes/router_config.dart';
import 'package:meal_pay/theme/app_colors.dart';

class MealPayApp extends StatelessWidget {
  const MealPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              iconTheme: IconThemeData(color: AppColors.textColor, size: 28.sp),
              scaffoldBackgroundColor: AppColors.primaryColor,
              appBarTheme: AppBarTheme(
                  color: AppColors.primaryColorDark,
                  iconTheme:
                      IconThemeData(color: AppColors.textColor, size: 28.sp))),
        );
      },
    );
  }
}
