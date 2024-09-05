import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters {
  glutenFree,
  vegan,
}

class FilterProviderNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterProviderNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.vegan: false,
        });
  changeFilter(Filters filter, bool value) {
    state = {...state, filter: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProviderNotifier, Map<Filters, bool>>(
        (ref) => FilterProviderNotifier());
