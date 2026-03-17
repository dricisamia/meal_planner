import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/week_days_card.dart';
import '../models/meal.dart';
import '../models/meals_of_a_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<MealsOfADay> dayMealsBox;

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
    MealsOfADay(day: 'Sunday', listOfMealsForADay: []),
    MealsOfADay(day: 'Monday', listOfMealsForADay: []),
    MealsOfADay(day: 'Tuesday', listOfMealsForADay: []),
    MealsOfADay(day: 'Wednesday', listOfMealsForADay: []),
    MealsOfADay(day: 'Thursday', listOfMealsForADay: []),
    MealsOfADay(day: 'Friday', listOfMealsForADay: []),
  ];

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    dayMealsBox = await Hive.openBox<MealsOfADay>('MealsBDD');
    if (dayMealsBox.isEmpty) {
      for (var e in week_days_list) {
        await dayMealsBox.put(e.day, e);
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    dayMealsBox.close();
    super.dispose();
  }

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