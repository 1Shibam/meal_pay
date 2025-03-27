import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_pay/models/meal_model.dart';
import 'package:meal_pay/services/meal_srvice.dart';
import 'package:meal_pay/widgets/custom_snackbar.dart';

class MealServiceNotifier extends StateNotifier<AsyncValue<List<MealModel>>> {
  final MealService meals;
  MealServiceNotifier(this.meals) : super(const AsyncValue.loading());

  Future<void> fetchMealsData(BuildContext context) async {
    try {
      final data = await meals.loadMealData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      if (context.mounted) {
        customSnackbar(context: context, message: 'Something went wrong!!');
      }
    }
  }
}

final mealsServiceStateNotiferProvider =
    StateNotifierProvider<MealServiceNotifier, AsyncValue<List<MealModel>>>(
        (ref) {
  final meals = ref.watch(mealServiceProvider);
  return MealServiceNotifier(meals);
});
