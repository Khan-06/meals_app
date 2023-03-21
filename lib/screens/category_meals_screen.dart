import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);
  //
  // final String categoryId;
  // final String categoryTitle;

  static const screenRoute = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.black, child: Text(categoryTitle!)),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(affordability: categoryMeals[index].affordability, title: categoryMeals[index].title, complexity: categoryMeals[index].complexity, duration: categoryMeals[index].duration, imageUrl: categoryMeals[index].imageUrl);
            },
            itemCount: categoryMeals.length));
  }
}
