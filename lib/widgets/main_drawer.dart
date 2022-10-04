import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class ListTileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() func;
  const ListTileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 26,
            fontWeight: FontWeight.bold),
      ),
      onTap: func,
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            "Cooking Up!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTileItem(
          title: "Meals",
          icon: Icons.restaurant,
          func: () => Navigator.of(context).pushReplacementNamed("/"),
        ),
        ListTileItem(
          title: "Filters",
          icon: Icons.settings,
          func: () => Navigator.of(context)
              .pushReplacementNamed(FiltersScreen.routeName),
        ),
      ]),
    );
  }
}
