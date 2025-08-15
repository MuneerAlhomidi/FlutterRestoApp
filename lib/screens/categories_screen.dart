import 'package:app04/data/dummy_data.dart';
import 'package:app04/models/meal.dart';
import 'package:app04/widgets/category_grid._item.dart';

import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (var category in availableCategories)
            CategoryGridItem(
              availableMeals: widget.availableMeals,
              category: category,
            ),

          // If you want to add a placeholder or an empty item, you can uncomment the line below
          //
        ],
      ),

      builder:
          (ctx, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo),
            ),
            child: child,
          ),
    );
  }
}
