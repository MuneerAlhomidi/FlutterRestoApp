import 'package:app04/provider/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
      });

  void stateFilters(Map<Filter, bool> chodenFilters) {
    state = chodenFilters;
  }

  void stateFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  // bool isFavorite(Meal meal) {
  //   return state.contains(meal);
  // }
}

final filtersProvider =
    StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
      (ref) => FilterProvider(),
    );

// This will trigger a rebuild when the meals change
final filterdMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final Map<Filter, bool> activeFilter = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
