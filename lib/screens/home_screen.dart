import 'package:flutter/material.dart';
import '../components/week_days_card.dart';

class HomeScreen extends StatelessWidget {
  final List<String> week_days_list = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
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
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: week_days_list.length,
        itemBuilder: (context, index) {
          return WeekDaysCard(day: week_days_list[index]);
        },
      ),
    );
  }
}