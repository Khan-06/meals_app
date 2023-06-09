import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category_meals';
  CategoryMealsScreen(this.availableMeals, {super.key});

   List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal> displayedMeals = [];
  @override
  //(void initState) not using it because we are using didChangeDependencies and initstate does not work with of(context)!
  @override
  void didChangeDependencies() {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    //print(displayedMeals.first.title);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // void removeMeal(String mealId) {
    //   setState(() {
    //     displayedMeals.removeWhere((element) => element.id == mealId);
    //   });
    // }

    return Scaffold(
        appBar: AppBar(
          title:
              Title(color: Colors.black, child: Text(categoryTitle ?? "N/A")),
        ),
        // body: ListView.builder(
        //     itemBuilder: (context, index) {
        //       return MealItem(
        //         affordability: (displayedMeals[index].affordability),
        //         title: (displayedMeals[index].title),
        //         complexity: (displayedMeals[index].complexity),
        //         duration: (displayedMeals[index].duration),
        //         imageUrl: (displayedMeals[index].imageUrl),
        //         id: (displayedMeals[index].id),
        //       );
        //     },
        //     itemCount: displayedMeals.length
        // )

      body: displayedMeals.isEmpty
          ? const Center(
              child: Text('No meals found!'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  affordability: (displayedMeals[index].affordability),
                  title: (displayedMeals[index].title),
                  complexity: (displayedMeals[index].complexity),
                  duration: (displayedMeals[index].duration),
                  imageUrl: (displayedMeals[index].imageUrl),
                  id: (displayedMeals[index].id),
                );
              },
              itemCount: displayedMeals.length,
            )
    );
  }
}
