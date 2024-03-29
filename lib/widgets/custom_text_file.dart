import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintText, this.onchanged, this.obscure = false});
  final String hintText;
  final Function(String)? onchanged;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is requird";
        }
        return null;
      },
      onChanged: onchanged,
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
