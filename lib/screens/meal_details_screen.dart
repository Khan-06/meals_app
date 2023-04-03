import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen(this.toggleFavorites, this.isFavorite );

  static const routeName = '/meal-detail';
  final Function toggleFavorites;
  final Function isFavorite;

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments.toString();
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext ctx, String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.titleLarge,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
          height: 250,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.fill),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 3,
          onPressed:
          () => toggleFavorites(mealId),
          child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border)
          ),
    );
  }
}
