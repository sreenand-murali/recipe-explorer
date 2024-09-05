import 'package:flutter/material.dart';
import 'package:food_app/models/categories.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screen/meals.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({required this.availableMeals, required this.category, super.key});
  final List<Meal> availableMeals;

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> dummyMeals = availableMeals
            .where((element) => element.categoryId == category.id)
            .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              mealList: dummyMeals,
              title: category.title,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color, category.color.withOpacity(.6)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
