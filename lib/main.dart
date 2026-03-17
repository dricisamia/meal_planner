import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/meal.dart';
import 'models/meals_of_a_day.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/meals_of_a_day_screen.dart';
import 'screens/add_new_meal_screen.dart';
import 'screens/ingredients_ofa_meal_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialiser Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialiser Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MealAdapter());
  Hive.registerAdapter(MealsOfADayAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meal Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.orange,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.orange),
        ),
      ),
      home: LoginScreen(),
      routes: {
        'Home': (context) => HomeScreen(),
        'Login': (context) => LoginScreen(),
        'Signup': (context) => SignupScreen(),
        'Meals': (context) => MealsOfADayScreen(),
        'AddNewMeal': (context) => AddNewMealScreen(),
        'Ingredients': (context) => IngredientsOfAMealScreen(),
      },
    );
  }
}