import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);
  //
  // final String categoryId;
  // final String categoryTitle;

  static const screenRoute =  '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text(categoryTitle!)),
      ),
      body: Center(child: Text(categoryId!)),
    );
  }
}
