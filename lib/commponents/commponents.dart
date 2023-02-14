import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  Color? textColor;
  double? fontSize;
  TextEditingController controller;
  TextInputType? keyboardType;
  String hint;
  Widget? prefixIcon;
  String? Function(String?) validate;

  DefaultFormField(
      {this.prefixIcon,
      this.textColor,
      this.fontSize,
      this.keyboardType,
      required this.hint,
      required this.controller,
      required this.validate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: textColor ?? const Color.fromARGB(255, 47, 84, 205),
        fontSize: fontSize ?? 20,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validate,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 47, 84, 205), width: 2),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        fillColor: const Color.fromARGB(255, 249, 247, 249),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 249, 247, 249), width: 2),
        ),
      ),
    );
  }
}
