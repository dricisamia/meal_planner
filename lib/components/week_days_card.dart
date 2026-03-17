import 'package:flutter/material.dart';
import '../models/meals_of_a_day.dart';
import '../models/meal.dart';

class WeekDaysCard extends StatelessWidget {
  final MealsOfADay dayAndItsListOfMeals;

  const WeekDaysCard({
    super.key,
    required this.dayAndItsListOfMeals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dayAndItsListOfMeals.day,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'Meals',
                      arguments: dayAndItsListOfMeals,
                    );
                  },
                  color: Colors.orange,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    final newMeal = await Navigator.pushNamed(
                      context,
                      'AddNewMeal',
                      arguments: dayAndItsListOfMeals,
                    );
                    if (newMeal != null) {
                      dayAndItsListOfMeals.listOfMealsForADay.add(newMeal as Meal);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}