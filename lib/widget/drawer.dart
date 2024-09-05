import 'package:flutter/material.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({required this.onSelectScreen, super.key});

  final Function(String id) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.5),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.fastfood, size: 40),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Hello',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.filter_list_alt),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onSelectScreen("filters");
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank),
            title: Text(
              "Categories",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onSelectScreen("categories");
            },
          ),
        
        ],
      ),
    );
  }
}
