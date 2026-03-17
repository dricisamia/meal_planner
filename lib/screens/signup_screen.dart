import 'package:flutter/material.dart';
import '../components/my_buttons.dart';
import '../components/my_textfield.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController pwdConfirmController = TextEditingController();

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
                'Create your account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              MyTextField(
                TFHintText: 'Username',
                TFIcon: Icon(Icons.person),
                isObscure: false,
                TFController: userController,
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              MyTextField(
                TFHintText: 'Confirm Password',
                TFIcon: Icon(Icons.lock),
                isObscure: true,
                TFController: pwdConfirmController,
              ),
              SizedBox(height: 15),
              MyElevatedButton(
                buttonLabel: 'Sign up',
                onPressedFct: () {},
              ),
              SizedBox(height: 10),
              Text('Or'),
              SizedBox(height: 10),
              MyElevatedButton(
                buttonLabel: 'Sign in with Google',
                onPressedFct: () {},
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  MyTextButton(
                    buttonLabel: 'Login',
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