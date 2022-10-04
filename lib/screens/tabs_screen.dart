import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/main_drawer.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen(this.favoriteMeals, {super.key});
  final List<Meal> favoriteMeals;
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {"page": FavoritesScreen(widget.favoriteMeals), "title": "Favorites"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
    instead of the app bar
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Text((_pages[_selectedIndex]['title'] as String)),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoraties",
          ),
        ],
      ),
    );
  }
}
