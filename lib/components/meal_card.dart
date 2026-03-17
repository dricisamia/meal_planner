import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final Function() onDeleteMeal;

  const MealCard({
    super.key,
    required this.meal,
    required this.onDeleteMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              meal.imgPath,
              height: 80,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Text(
                meal.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'Ingredients',
                        arguments: meal,
                      );
                    },
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: onDeleteMeal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}