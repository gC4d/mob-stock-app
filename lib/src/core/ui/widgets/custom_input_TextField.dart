import 'package:flutter/material.dart';

class CustomInputTextfield extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function(String) onChanged;
  final bool obscureText;
  final double? height;
  final double? width;
  const CustomInputTextfield({
    Key? key,
    required this.label,
    required this.onChanged,
    this.obscureText = false,
    this.height,
    this.width,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: icon,
          hintText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
