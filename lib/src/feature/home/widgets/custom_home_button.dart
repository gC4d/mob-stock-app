import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  final double height;
  final double width;
  final String label;
  final IconData icon;
  final VoidCallback function;
  const CustomHomeButton({ Key? key, required this.height, required this.width, required this.label, required this.icon, required this.function }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return GestureDetector(
                onTap: function,
                child: Container(
                  width: width,
                  height: height,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(.6),
                        size: 35,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                       label,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}