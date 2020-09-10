import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Icon icon;
  String hintText;
  bool isPassword;
  TextInputType textType;
  TextEditingController controller;

  CustomTextField({
    @required this.icon,
    @required this.hintText,
    @required this.controller,
    this.isPassword = false,
    this.textType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        controller: controller,
        autocorrect: false,
        keyboardType: textType,
        obscureText: isPassword,
        decoration: InputDecoration(
            prefixIcon: icon,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText),
      ),
    );
  }
}
