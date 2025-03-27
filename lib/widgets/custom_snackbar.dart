import 'package:flutter/material.dart';
import 'package:meal_pay/theme/app_colors.dart';

void customSnackbar(
    {required BuildContext context,
    required String message,
    int duration = 2,
    Color bgColor = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: AppTextStyles.body,
    ),
    backgroundColor: bgColor,
    duration: Duration(seconds: duration),
  ));
}
