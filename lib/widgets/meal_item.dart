import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {required this.affordability,
      required this.title,
      required this.complexity,
      required this.duration,
      required this.imageUrl});

  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}
