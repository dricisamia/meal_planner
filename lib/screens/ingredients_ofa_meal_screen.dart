import 'package:flutter/material.dart';

class IngredientsOfAMealScreen extends StatelessWidget {
  const IngredientsOfAMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Ingredients list of the meal',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 0,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.amber,
            child: ListTile(
              title: Text(
                'Ingredient',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}