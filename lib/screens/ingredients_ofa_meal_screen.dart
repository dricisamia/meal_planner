import 'package:flutter/material.dart';
import '../models/meal.dart';

class IngredientsOfAMealScreen extends StatelessWidget {
  const IngredientsOfAMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMeal =
        ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Ingredients list of ${currentMeal.name}',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                'Login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: currentMeal.listOfIngredients.length,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.amber,
            child: ListTile(
              title: Text(
                currentMeal.listOfIngredients[i],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}