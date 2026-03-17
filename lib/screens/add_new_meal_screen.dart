import 'package:flutter/material.dart';
import '../components/my_textfield.dart';
import '../components/my_buttons.dart';

class AddNewMealScreen extends StatefulWidget {
  const AddNewMealScreen({super.key});

  @override
  State<AddNewMealScreen> createState() => _AddNewMealScreenState();
}

class _AddNewMealScreenState extends State<AddNewMealScreen> {
  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController imgPathController = TextEditingController();
  List<MyTextField> listOfMyTextField = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adding a new meal',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              MyTextField(
                TFHintText: 'Enter meal\'s name',
                TFIcon: Icon(Icons.restaurant_menu),
                isObscure: false,
                TFController: mealNameController,
              ),
              SizedBox(height: 10),
              MyTextField(
                TFHintText: 'Enter image path',
                TFIcon: Icon(Icons.image),
                isObscure: false,
                TFController: imgPathController,
              ),
              SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'List of ingredient',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              if (listOfMyTextField.isNotEmpty) {
                                listOfMyTextField.removeLast();
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              listOfMyTextField.add(
                                MyTextField(
                                  TFHintText: 'Enter an ingredient',
                                  TFIcon: Icon(Icons.abc),
                                  isObscure: false,
                                  TFController: TextEditingController(),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfMyTextField.length,
                      itemBuilder: (context, i) {
                        return listOfMyTextField[i];
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MyElevatedButton(
                buttonLabel: 'Add the meal',
                onPressedFct: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}