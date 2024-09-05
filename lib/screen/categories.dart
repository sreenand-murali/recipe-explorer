import 'package:flutter/material.dart';
import 'package:food_app/datas/categories.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widget/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.availableMeals, super.key});

  final List<Meal> availableMeals;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in categories)
            CategoriesWidget(
              availableMeals: availableMeals,
              category: category,
            )
        ],
      ),
    );
  }
}
