import 'package:flutter/material.dart';
import '../components/my_buttons.dart';
import '../components/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                'Welcome to my App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              SizedBox(height: 20),
              MyTextField(
                TFHintText: 'Email',
                TFIcon: Icon(Icons.email),
                isObscure: false,
                TFController: emailController,
              ),
              SizedBox(height: 10),
              MyTextField(
                TFHintText: 'Password',
                TFIcon: Icon(Icons.lock),
                isObscure: true,
                TFController: pwdController,
              ),
              SizedBox(height: 15),
              MyElevatedButton(
                buttonLabel: 'Login',
                onPressedFct: () {},
              ),
              SizedBox(height: 10),
              MyTextButton(
                buttonLabel: 'Forgot your password ?',
                onPressedFct: () {},
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  MyTextButton(
                    buttonLabel: 'Signup',
                    onPressedFct: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}