import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String TFHintText;
  final Icon TFIcon;
  final TextEditingController TFController;
  final bool isObscure;
  final String? Function(String?)? TFValidator;

  const MyTextField({
    super.key,
    required this.TFHintText,
    required this.TFIcon,
    required this.TFController,
    required this.isObscure,
    this.TFValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: TFValidator,
      controller: TFController,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: TFHintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        filled: true,
        prefixIcon: TFIcon,
      ),
    );
  }
}