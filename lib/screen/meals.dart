import 'package:flutter/material.dart';
import 'package:food_app/models/categories.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widget/meal_widget.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.mealList, required this.title, super.key});
  final List<Meal> mealList;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mealList.isEmpty?const Center(child: Text("No Meals to Show")):ListView.builder(
      itemCount: mealList.length,
      itemBuilder: (ctx, index) => MealWidget(meal: mealList[index]),),
    );
  }
}
