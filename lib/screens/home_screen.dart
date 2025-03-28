import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_pay/providers/meal_service_state_provider.dart';
import 'package:meal_pay/services/set_login_preference.dart';
import 'package:meal_pay/theme/app_colors.dart';
import 'package:meal_pay/widgets/custom_snackbar.dart';


//search query state provider for filtering 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
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
        drawer: const HomeScreenDrawer(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 1, 38, 27),
            Color.fromARGB(255, 0, 126, 90)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h)
                .copyWith(top: 28.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeScreenSearhBar(),
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
                          return Expanded(
                            child: ListView.builder(
                              itemCount: mealData.length,
                              itemBuilder: (context, index) {
                                final singleMeal = mealData[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.h),
                                  child: Card(
                                    color: AppColors.primaryColorDark,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.h, horizontal: 8.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.r),
                                                      child: Image.network(
                                                        fit: BoxFit.fill,
                                                        singleMeal.imageUrl,
                                                        width: 140.w,
                                                        height: 140.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Text(
                                                      singleMeal.category,
                                                      style: AppTextStyles
                                                          .subheading,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  child: SizedBox(
                                                      height: 200.h,
                                                      child:
                                                          const VerticalDivider(
                                                        color: AppColors
                                                            .subTextColor,
                                                      ))),
                                              Flexible(
                                                  flex: 3,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        singleMeal.name,
                                                        style: AppTextStyles
                                                            .button,
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        '${singleMeal.calories.toString()} cals',
                                                        style:
                                                            AppTextStyles.body,
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "${singleMeal.protein.toString()}g Protein",
                                                        style:
                                                            AppTextStyles.body,
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "${singleMeal.carbs.toString()}g Carbs",
                                                        style:
                                                            AppTextStyles.body,
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "${singleMeal.fats.toString()}g fats",
                                                        style:
                                                            AppTextStyles.body,
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.all(12.r),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  color:
                                                      AppColors.primaryColor),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        '${singleMeal.price}\$',
                                                        style: AppTextStyles
                                                            .button,
                                                      )),
                                                  Expanded(
                                                      child: SizedBox(
                                                          height: 24.h,
                                                          child:
                                                              const VerticalDivider(
                                                            color: AppColors
                                                                .textColor,
                                                          ))),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Add to cart',
                                                        style: AppTextStyles
                                                            .button,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
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
          ),
        ));
  }
}

class HomeScreenSearhBar extends StatelessWidget {
  const HomeScreenSearhBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textStyle: WidgetStatePropertyAll(
          AppTextStyles.button.copyWith(color: AppColors.primaryColorDark)),
      hintText: 'Search Meal',
      hintStyle: WidgetStatePropertyAll(
          AppTextStyles.button.copyWith(color: AppColors.primaryColorDark)),
      backgroundColor: const WidgetStatePropertyAll(AppColors.subTextColor),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search,
            size: 40.sp,
            color: AppColors.primaryColorDark,
          ),
          SizedBox(
            height: 28.h,
            child: const VerticalDivider(
              color: AppColors.primaryColorDark,
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
