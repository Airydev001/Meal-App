import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});
  final Meal meal;

  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star))
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(meal.imageUrl,
              height: 300, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(
            height: 14,
          ),
          const Text("Ingredients",
              style: TextStyle(
                color: Color.fromARGB(255, 190, 42, 42),
                fontSize: 24,
                fontFamily: "Oswald",
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Text(ingredient,
                style: const TextStyle(
                    color: Color.fromARGB(243, 255, 255, 255), fontSize: 19)),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Steps',
            style: TextStyle(
              color: Color.fromARGB(255, 190, 42, 42),
              fontWeight: FontWeight.bold,
            ),
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(step,
                  style: const TextStyle(
                      color: Color.fromARGB(243, 255, 255, 255), fontSize: 19)),
            ),
          const SizedBox(
            height: 14,
          ),
        ]),
      ),
    );
  }
}
