import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/providers/meal_service_state_provider.dart';
import 'package:meal_pay/services/set_login_preference.dart';
import 'package:meal_pay/theme/app_colors.dart';
import 'package:meal_pay/widgets/custom_snackbar.dart';

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h)
              .copyWith(top: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: AppColors.subTextColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              Title(
                  color: AppColors.textColor,
                  child: Text(
                    'Available meals',
                    style: AppTextStyles.heading,
                  )),
              SizedBox(
                height: 16.h,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final mealAsyncData =
                      ref.watch(mealsServiceStateNotiferProvider);
                  return mealAsyncData.when(
                      data: (mealData) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return const Card();
                          },
                        );
                      },
                      error: (error, stackTrace) {
                        customSnackbar(
                            context: context,
                            message: 'Opps something went wrong');
                        debugPrint(error.toString());
                        debugPrintStack(stackTrace: stackTrace);

                        return const Center(
                          child: Text('Error fetching data'),
                        );
                      },
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ));
                },
              )
            ],
          ),
        ));
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
