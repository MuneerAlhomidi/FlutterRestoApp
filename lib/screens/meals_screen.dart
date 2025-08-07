import 'package:app04/models/meal.dart';
import 'package:app04/screens/meal_details_screen.dart';
import 'package:app04/widgets/meals_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(appBar: AppBar(title: Text(title!)), body: content(context));
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            meals
                .map(
                  (meal) => MealItem(
                    meal: meal,
                    onSelectMeal: (Meal meal) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (ctx) => MealDetailsScreen.mealDetailsScreen(
                                meal: meal,
                              ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
