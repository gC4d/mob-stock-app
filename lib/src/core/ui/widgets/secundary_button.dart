import 'package:flutter/material.dart';

class SecundaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? height;
  final double? width;
  final double? elevation;
  const SecundaryButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.height,
      this.width,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onPrimary),
            elevation: MaterialStateProperty.all(elevation)),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
