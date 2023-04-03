import 'package:flutter/material.dart';

import './screens/Category_Screen.dart';
import './dummy_data.dart';
import './models/meals.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
//import './screens/tabs_screen.dart';
import './screens/tabs_screen_2.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites (String mealID){
    final existingIndex = _favoriteMeals.indexWhere((element) => element.id == mealID);
    if(existingIndex >=0){
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealID),);
    }
    setState(() {
    });
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.deepOrangeAccent),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) =>  TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>  MealDetailScreen(_toggleFavorites, _isMealFavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(_filters,_setFilters)
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
