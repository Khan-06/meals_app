import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen(this.favoriteMeal);

  final List<Meal> favoriteMeal;

  @override
  Widget build(BuildContext context) {
     if (favoriteMeal.isEmpty){
      return const Text('You have no favorites yet!');
    } else{
       return ListView.builder(
           itemBuilder: (context, index) {
             return MealItem(
               affordability: (favoriteMeal[index].affordability),
               title:  (favoriteMeal[index].title),
               complexity: (favoriteMeal[index].complexity),
               duration: (favoriteMeal[index].duration),
               imageUrl: (favoriteMeal[index].imageUrl),
               id: (favoriteMeal[index].id),
             );
           },
           itemCount: favoriteMeal.length);
     }
  }
}
