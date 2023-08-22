import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(children: [
            Icon(Icons.fastfood,
                size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(
              width: 18,
            ),
            Text('Cooking Up!',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oswald",
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary))
          ]),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text('Meals',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary)),
          onTap: () {
            onSelectScreen('meals');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text('Filters',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary)),
          onTap: () {
            onSelectScreen('filters');
          },
        ),
      ]),
    );
  }
}
