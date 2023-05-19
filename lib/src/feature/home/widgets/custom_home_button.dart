import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/feature/home/home_controller.dart';
import 'package:mob_storage_app/src/feature/home/home_page.dart';
import 'package:mob_storage_app/src/feature/home/home_router.dart';
import 'package:mob_storage_app/src/feature/stock/page/stock_page.dart';

import '../../stock/stock_router.dart';

class CustomHomeButton extends StatelessWidget {
  final double height;
  final double width;
  final String description;
  final int category;
  const CustomHomeButton({
    Key? key,
    required this.height,
    required this.width,
    required this.description,
    required this.category,
  }) : super(key: key);

  String getCategory(int categoryIndex) {
    String category = '';
    switch (categoryIndex) {
      case 0:
        category = "Matéria-prima";
        break;
      case 1:
        category = "Bens de varejo";
        break;
      case 2:
        category = "Consumo interno";
        break;
      case 3:
        category = "Estoque de segurança";
        break;
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                getCategory(category),
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
        ],
      ),
    );
  }
}
