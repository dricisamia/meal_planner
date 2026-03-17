import 'package:flutter/material.dart';
import '../components/meal_card.dart';
import '../models/meals_of_a_day.dart';

class MealsOfADayScreen extends StatefulWidget {
  const MealsOfADayScreen({super.key});

  @override
  State<MealsOfADayScreen> createState() => _MealsOfADayScreenState();
}

class _MealsOfADayScreenState extends State<MealsOfADayScreen> {
  @override
  Widget build(BuildContext context) {
    final dayAndItsListOfMeals =
        ModalRoute.of(context)?.settings.arguments as MealsOfADay;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Meals for ${dayAndItsListOfMeals.day}',
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
      body: GridView.builder(
        itemCount: dayAndItsListOfMeals.listOfMealsForADay.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return MealCard(
            meal: dayAndItsListOfMeals.listOfMealsForADay[index],
          );
        },
      ),
    );
  }
}