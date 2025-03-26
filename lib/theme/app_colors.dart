import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const primaryColor = Color(0xFF00523B);
  static const primaryColorDark = Color.fromARGB(255, 0, 48, 34);
  static const textColor = Color(0xFFD9FFE3);
  static const subTextColor = Color.fromARGB(255, 188, 221, 197);
}

class AppTextStyles {
  static TextStyle heading = TextStyle(
      fontSize: 32.sp.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor);
  static TextStyle subheading = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.subTextColor);

  static TextStyle body = TextStyle(
    fontSize: 16.sp,
    color: AppColors.subTextColor,
  );

  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    color: AppColors.subTextColor,
  );

  static TextStyle button = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle underlined = TextStyle(
      fontSize: 16.sp,
      decoration: TextDecoration.underline,
      color: AppColors.subTextColor);

  static TextStyle strikethrough = TextStyle(
      fontSize: 16.sp,
      decoration: TextDecoration.lineThrough,
      color: AppColors.subTextColor);

  static TextStyle custom(
      {double fontSize = 16,
      Color color = AppColors.textColor,
      FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
