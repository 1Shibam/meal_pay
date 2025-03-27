import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_pay/models/meal_model.dart';

class MealService {
  Future<List<MealModel>> loadMealData() async {
    // Loading json file --

    final String jsonStr =
        await rootBundle.loadString('assets/data/meal_data.json');
    List<dynamic> jsonList = jsonDecode(jsonStr);
    return jsonList.map((json) => MealModel.fromJson(json)).toList();
  }
}


//provier for meal service 
final mealServiceProvider = Provider<MealService>((ref) => MealService());
