import 'package:app04/data/dummy_data.dart';
import 'package:app04/models/meal.dart';
import 'package:app04/widgets/category_grid._item.dart';

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (var category in availableCategories)
          CategoryGridItem(availableMeals: availableMeals, category: category),

        // If you want to add a placeholder or an empty item, you can uncomment the line below
        //
      ],
    );
  }
}
