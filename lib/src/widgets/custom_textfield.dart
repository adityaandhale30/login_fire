import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextStyle? inputTextStyle;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.inputTextStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(labelText: hintText),
      style: inputTextStyle,
    );
  }
}
