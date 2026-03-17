class Meal {
  final String name;
  final String imgPath;
  final List<String> listOfIngredients;
  final String? identifier;

  Meal({
    required this.name,
    required this.imgPath,
    required this.listOfIngredients,
    this.identifier,
  });
}