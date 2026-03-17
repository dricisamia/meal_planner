import 'package:flutter/material.dart';
import '../components/week_days_card.dart';
import '../models/meal.dart';
import '../models/meals_of_a_day.dart';

class HomeScreen extends StatelessWidget {
  final List<MealsOfADay> week_days_list = [
    MealsOfADay(
      day: 'Saturday',
      listOfMealsForADay: [
        Meal(
          name: 'Pizza',
          imgPath: 'assets/images/logo.png',
          listOfIngredients: ['Tomato', 'Cheese', 'Flour'],
        ),
      ],
    ),
    MealsOfADay(
      day: 'Sunday',
      listOfMealsForADay: [],
    ),
    MealsOfADay(
      day: 'Monday',
      listOfMealsForADay: [],
    ),
    MealsOfADay(
      day: 'Tuesday',
      listOfMealsForADay: [],
    ),
    MealsOfADay(
      day: 'Wednesday',
      listOfMealsForADay: [],
    ),
    MealsOfADay(
      day: 'Thursday',
      listOfMealsForADay: [],
    ),
    MealsOfADay(
      day: 'Friday',
      listOfMealsForADay: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home page',
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
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: week_days_list.length,
        itemBuilder: (context, index) {
          return WeekDaysCard(
            dayAndItsListOfMeals: week_days_list[index],
          );
        },
      ),
    );
  }
}