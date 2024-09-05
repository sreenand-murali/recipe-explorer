import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/provider/favourite_meals_provider.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favMeals = ref.watch(favMealsProvider);
    final bool isFav = favMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                bool isAdded =
                    ref.read(favMealsProvider.notifier).toggleFav(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isAdded
                        ? 'Added to Favourites'
                        : "removed from favourites"),
                  ),
                );
              },
              icon: Icon(isFav ? Icons.star : Icons.star_border))
        ],
      ),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
