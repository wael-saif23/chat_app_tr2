import 'package:flutter/material.dart';

class CustomTextFile extends StatelessWidget {
  const CustomTextFile({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "Please insert your $hintText",
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.6),
        ),
        labelText: hintText,
        labelStyle: const TextStyle(color: Colors.green),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
