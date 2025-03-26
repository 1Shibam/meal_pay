import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/services/set_login_preference.dart';
import 'package:meal_pay/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Meal Pay',
            style: AppTextStyles.subheading,
          ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )),
      drawer: Drawer(
        backgroundColor: AppColors.primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Menu',
                style: AppTextStyles.heading,
              ),
            )),
            CustomTiles(
              iconName: Icons.home,
              title: 'Home',
              onTap: () => context.pop(),
            ),
            CustomTiles(
              iconName: Icons.history,
              title: 'Order History',
              onTap: () {},
            ),
            CustomTiles(
              iconName: Icons.logout,
              title: 'Logout',
              onTap: () {
                setLoginPreference(false);
                context.go('/splash');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'This is home screen',
          style: AppTextStyles.heading,
        ),
      ),
    );
  }
}

class CustomTiles extends StatelessWidget {
  const CustomTiles(
      {super.key, required this.iconName, required this.title, this.onTap});
  final String title;
  final IconData iconName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyles.subheading,
      ),
      leading: Icon(
        iconName,
        color: AppColors.textColor,
      ),
    );
  }
}
