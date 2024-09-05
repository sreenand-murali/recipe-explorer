import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_app/models/meal.dart';
import 'package:food_app/provider/favourite_meals_provider.dart';
import 'package:food_app/provider/filter_provider.dart';
import 'package:food_app/provider/meals_provider.dart';
import 'package:food_app/screen/categories.dart';
import 'package:food_app/screen/filters.dart';
import 'package:food_app/screen/meals.dart';
import 'package:food_app/widget/drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  void onSelectScreen(String id) {
    Navigator.of(context).pop();
    if (id == 'filters') {
      Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  final List<Meal> favouritesList = [];

  @override
  Widget build(BuildContext context) {
    final Map<Filters, bool> result = ref.watch(filterProvider);

    List<Meal> mealsList = ref.watch(mealsProvider);
    final List<Meal> filteredMeals = mealsList.where(
      (element) {
        if (result[Filters.glutenFree]! && !element.glutenFree) {
          return false;
        }
        if (result[Filters.vegan]! && !element.vegan) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget selectedScreen = CategoriesScreen(
      availableMeals: filteredMeals,
    );
    String selectedScreenTitle = "Categories";

    if (_selectedIndex == 1) {
      final favoriteMeals = ref.watch(favMealsProvider);
      selectedScreen =
          MealsScreen(mealList: favoriteMeals, title: "Your Favourites");
      selectedScreenTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedScreenTitle),
      ),
      drawer: DrawerWidget(onSelectScreen: onSelectScreen),
      body: selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
          ]),
    );
  }
}
