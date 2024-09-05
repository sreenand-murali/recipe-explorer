import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/filter_provider.dart';




class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final Map<Filters,bool> result = ref.watch(filterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        
        body: Column(
          children: [
            SwitchListTile(
              value: result[Filters.glutenFree]!,
              onChanged: (value) {
                ref.read(filterProvider.notifier).changeFilter(Filters.glutenFree, value);
              },
              title: const Text("Glutten Free"),
              subtitle: const Text("select only gluten free food"),
            ),
            SwitchListTile(
              value: result[Filters.vegan]!,
              onChanged: (value) {
                ref.read(filterProvider.notifier).changeFilter(Filters.vegan, value);
              },
              title: const Text("Vegetarian"),
              subtitle: const Text("select only vegan food"),
            )
          ],
        ),
      );
  }
}
