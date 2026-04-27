import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final bool? obscureText;
  final hintStyle;
  final validator;
  final TextEditingController controller;

  const CommonTextField({
    super.key,
    required this.keyboardType,
    required this.hintText,
    this.obscureText,
    required this.hintStyle,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }
}
