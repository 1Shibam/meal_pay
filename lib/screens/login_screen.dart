import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/services/set_login_preference.dart';
import 'package:meal_pay/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login To Continue..',
                  style: AppTextStyles.heading,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomButton(
                    buttonText: 'Login',
                    onPressed: () {
                      setLoginPreference(true);
                      context.go('/home');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            color: AppColors.primaryColorDark,
            borderRadius: BorderRadius.circular(20.r)),
        child: Center(
          child: Text(
            'Login',
            style: AppTextStyles.button,
          ),
        ),
      ),
    );
  }
}
