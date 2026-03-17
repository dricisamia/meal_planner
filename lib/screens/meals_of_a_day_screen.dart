import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/meal_card.dart';
import '../models/meal.dart';
import '../models/meals_of_a_day.dart';

class MealsOfADayScreen extends StatefulWidget {
  const MealsOfADayScreen({super.key});

  @override
  State<MealsOfADayScreen> createState() => _MealsOfADayScreenState();
}

class _MealsOfADayScreenState extends State<MealsOfADayScreen> {

  Future<void> deleteAMeal(
      Meal mealToRemove, MealsOfADay dayAndItsListOfMeals) async {
    setState(() {
      dayAndItsListOfMeals.listOfMealsForADay.remove(mealToRemove);
    });
    Box<MealsOfADay> dayMealsBox = Hive.box<MealsOfADay>('MealsBDD');
    await dayMealsBox.put(dayAndItsListOfMeals.day, dayAndItsListOfMeals);
  }

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
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
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
            onDeleteMeal: () => deleteAMeal(
              dayAndItsListOfMeals.listOfMealsForADay[index],
              dayAndItsListOfMeals,
            ),
          );
        },
      ),
    );
  }
}