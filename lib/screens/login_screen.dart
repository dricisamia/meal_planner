import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/my_buttons.dart';
import '../components/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> keyFormState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

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
                  TFValidator: (val) {
                    if (val!.isEmpty) return "Email can't be empty";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  TFHintText: 'Password',
                  TFIcon: Icon(Icons.lock),
                  isObscure: true,
                  TFController: pwdController,
                  TFValidator: (val) {
                    if (val!.isEmpty) return "Password can't be empty";
                    return null;
                  },
                ),
                SizedBox(height: 15),
                MyElevatedButton(
                  buttonLabel: 'Login',
                  onPressedFct: () async {
                    if (keyFormState.currentState!.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: pwdController.text,
                        );
                        if (userCredential.user!.emailVerified) {
                          Navigator.pushReplacementNamed(context, 'Home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Veuillez vérifier votre email avant de vous connecter !'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message ?? 'Erreur inconnue'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } else {
                      print("Not Valid");
                    }
                  },
                ),
                SizedBox(height: 10),
                MyTextButton(
                  buttonLabel: 'Forgot your password ?',
                  onPressedFct: () async {
                    try {
                      if (emailController.text.isNotEmpty) {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Email de réinitialisation envoyé !'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Entrez votre email d\'abord !'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message ?? 'Erreur inconnue'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
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
                      onPressedFct: () {
                        Navigator.pushReplacementNamed(context, 'Signup');
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