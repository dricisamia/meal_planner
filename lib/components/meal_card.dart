import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String mealName;
  final String imgPath;

  const MealCard({
    super.key,
    required this.mealName,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              imgPath,
              height: 80,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Text(
                mealName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}