import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/feature/home/home_controller.dart';

class CustomHomeButton extends StatelessWidget {
  final double height;
  final double width;
  final String description;
  final String category;
  const CustomHomeButton({
    Key? key,
    required this.height,
    required this.width,
    required this.description,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/stock", arguments: {"stock_description": description}),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(.6),
                  ),
                ),
                Text(
                  category.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(.6),
                  ),
                ),
                SizedBox(
                  height: context.percentHeight(.03),
                ),
              ],
            ),
            //IconButton(onPressed: () {}, icon: Icon(Icons.)),
          ],
        ),
      ),
    );
  }
}
