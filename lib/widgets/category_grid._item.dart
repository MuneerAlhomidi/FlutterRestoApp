import 'package:app04/data/dummy_data.dart';
import 'package:app04/models/category.dart';
import 'package:app04/models/meal.dart';
import 'package:app04/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,

    required this.availableMeals,
  });

  final Category category;

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: () {
        final filterMeal =
            dummyMeals
                .where((meal) => meal.categories.contains(category.id))
                .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (ctx) => MealsScreen(title: category.title, meals: filterMeal),
          ),
        );
      },
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.54),
              category.color.withValues(alpha: 0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
