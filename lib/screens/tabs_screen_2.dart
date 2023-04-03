import 'package:flutter/material.dart';

import './Category_Screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen(this.favoriteMeals, {super.key});

  List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, dynamic>> _pages = [];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page':  FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites')
        ],
      ),
    );
  }
}
