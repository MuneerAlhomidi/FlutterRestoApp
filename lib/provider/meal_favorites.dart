import 'package:app04/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false; // Meal was removed from favorites
    } else {
      state = [...state, meal];
      return true; // Meal was added to favorites
    }
  }

  // bool isFavorite(Meal meal) {
  //   return state.contains(meal);
  // }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
      return FavoriteMealNotifier();
    });
