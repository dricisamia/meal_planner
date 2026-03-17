import 'package:flutter/material.dart';
import '../components/meal_card.dart';

class MealsOfADayScreen extends StatefulWidget {
  const MealsOfADayScreen({super.key});

  @override
  State<MealsOfADayScreen> createState() => _MealsOfADayScreenState();
}

class _MealsOfADayScreenState extends State<MealsOfADayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Meals of the day',
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
      body: GridView.builder(
        itemCount: 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return MealCard(
            mealName: 'Meal',
            imgPath: 'assets/images/logo.png',
          );
        },
      ),
    );
  }
}