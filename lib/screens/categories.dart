//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite,required this.availableMeals,});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
