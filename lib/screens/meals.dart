import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_details.dart';
import 'package:meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal,onToggleFavorite: onToggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: selectMeal,
      ),
    );
    if (meals.isEmpty) {
      content = Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Uh oh ... nothing here!',
            style: TextStyle(
              fontFamily: "Oswald",
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            )),
        const SizedBox(height: 16),
        Text('Try selecting a different category!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontFamily: "Oswald",
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ))
      ]));
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
