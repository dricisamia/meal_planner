import 'package:hive/hive.dart';
import 'meal.dart';
part 'meals_of_a_day.g.dart';

@HiveType(typeId: 1)
class MealsOfADay {
  @HiveField(0)
  final String day;

  @HiveField(1)
  List<Meal> listOfMealsForADay;

  MealsOfADay({
    required this.day,
    required this.listOfMealsForADay,
  });
}