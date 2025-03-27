import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_pay/models/meal_model.dart';
import 'package:meal_pay/services/meal_srvice.dart';

class MealServiceNotifier extends StateNotifier<AsyncValue<List<MealModel>>> {
  final MealService meals;
  MealServiceNotifier(this.meals) : super(const AsyncValue.loading()) {
    fetchMealsData();
  }

  Future<void> fetchMealsData() async {
    try {
      final data = await meals.loadMealData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final mealsServiceStateNotiferProvider =
    StateNotifierProvider<MealServiceNotifier, AsyncValue<List<MealModel>>>(
        (ref) {
  final meals = ref.watch(mealServiceProvider);
  return MealServiceNotifier(meals);
});
