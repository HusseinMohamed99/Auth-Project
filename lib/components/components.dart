import 'package:auth_project/OnBoarding/on_boarding_screen.dart';
import 'package:auth_project/components/navigator.dart';
import 'package:auth_project/shared/cache_helper.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final Color? textColor;
  final double? fontSize;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hint;
  final Widget? prefixIcon;
  final IconData? suffix;
  final String? Function(String?) validate;
  final bool? isPassword;
  final Function? suffixPressed;

  const DefaultFormField(
      {this.isPassword,
      this.suffixPressed,
      this.prefixIcon,
      this.suffix,
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
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: const Icon(Icons.remove_red_eye_outlined))
            : null,
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

void logOut(context) {
  CacheHelper.removeData(key: 'uId').then((value) {
    if (value) {
      navigateAndFinish(context, const OnBoardScreen());
    }
  });
}
