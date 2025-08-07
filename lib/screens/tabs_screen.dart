import 'package:app04/provider/filter_provider.dart';
import 'package:app04/provider/meal_favorites.dart';

import '../models/meal.dart';

import 'package:app04/screens/categories_screen.dart';
import 'package:app04/screens/filter_screen.dart';
import 'package:app04/screens/meals_screen.dart';
import 'package:app04/widgets/mian_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // This state can be used to manage the selected tab or other stateful logic
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setSecreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => FilterScreen()),
      );

      // This could involve updating the state or filtering meals based on the selected filters
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(
      filterdMealsProvider,
    ); // Ensure filters are watched for changes
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    ); // Replace with your categories screen
    var activePageTitle = 'Pick your category';
    if (_selectedIndex == 1) {
      final List<Meal> favoriteMeals = ref.read(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      ); // Replace with your favorites screen
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _setSecreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
