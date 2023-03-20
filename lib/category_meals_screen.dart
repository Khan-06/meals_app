import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  final String categoryId;
  final String categoryTitle;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child:  Text(categoryTitle)),
      ),
      body:  const Center(child: Text('data')),
    );
  }
}
