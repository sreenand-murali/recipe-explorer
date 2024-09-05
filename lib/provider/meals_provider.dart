import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/datas/meals.dart';

final mealsProvider = Provider((ref){
  return mealsList;
});  