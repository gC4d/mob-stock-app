// ignore_for_file: file_names

import 'package:flutter/material.dart' show BorderRadius, BorderSide, BuildContext, Icon, InputDecoration, Key, OutlineInputBorder, SizedBox, StatelessWidget, TextField, Theme, Widget;

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
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 100,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          hintText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
