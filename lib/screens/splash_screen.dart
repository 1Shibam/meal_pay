import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async {
    final bool loginStatus = await isLoggedIn(); // Wait for login status first

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      context.go(loginStatus ? '/home' : '/login');
    }
  }

  Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/play_store_512.png',
              width: 160.w,
              height: 160.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            AnimatedTextKit(animatedTexts: [
              TyperAnimatedText('Locading...',
                  speed: const Duration(milliseconds: 100),
                  textStyle: AppTextStyles.heading)
            ])
          ],
        ),
      ),
    );
  }
}
