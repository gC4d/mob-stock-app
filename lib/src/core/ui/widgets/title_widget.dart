import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String label;
  const TitleWidget({ Key? key, required this.label }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Text(
          label,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        );
  }
}