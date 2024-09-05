import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';

class FavMealNotifier extends StateNotifier<List<Meal>> {
  FavMealNotifier() : super([]);
  bool toggleFav(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.title != meal.title).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favMealsProvider = StateNotifierProvider<FavMealNotifier,List<Meal>>((ref) {
  return FavMealNotifier();
});
