import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String buttonLabel;
  final Function() onPressedFct;

  const MyTextButton({
    super.key,
    required this.buttonLabel,
    required this.onPressedFct,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFct,
      child: Text(
        buttonLabel,
        style: TextStyle(color: Colors.orange),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final String buttonLabel;
  final Function() onPressedFct;

  const MyElevatedButton({
    super.key,
    required this.buttonLabel,
    required this.onPressedFct,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressedFct,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.orange),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(buttonLabel),
      ),
    );
  }
}