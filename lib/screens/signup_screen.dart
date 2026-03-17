import 'package:flutter/material.dart';
import '../components/my_buttons.dart';
import '../components/my_textfield.dart';
import '../helpers/validators.dart';

class SignupScreen extends StatelessWidget {
  GlobalKey<FormState> keyFormState = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController pwdConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: keyFormState,
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
                  TFValidator: (val) {
                    if (val!.isEmpty) return "Username Can't be empty";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  TFHintText: 'Email',
                  TFIcon: Icon(Icons.email),
                  isObscure: false,
                  TFController: emailController,
                  TFValidator: (val) => emailValidationFct(val),
                ),
                SizedBox(height: 10),
                MyTextField(
                  TFHintText: 'Password',
                  TFIcon: Icon(Icons.lock),
                  isObscure: true,
                  TFController: pwdController,
                  TFValidator: (val) => pwdValidationFct(val),
                ),
                SizedBox(height: 10),
                MyTextField(
                  TFHintText: 'Confirm Password',
                  TFIcon: Icon(Icons.lock),
                  isObscure: true,
                  TFController: pwdConfirmController,
                  TFValidator: (val) =>
                      pwdConfirmValidationFct(val, pwdController.text),
                ),
                SizedBox(height: 15),
                MyElevatedButton(
                  buttonLabel: 'Sign up',
                  onPressedFct: () {
                    if (keyFormState.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, 'Login');
                    } else {
                      print("Not Valid");
                    }
                  },
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
                      onPressedFct: () {
                        Navigator.pushReplacementNamed(context, 'Login');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}