import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../stock_controller.dart';

class CategoriesStockDropdown extends StatefulWidget {
  const CategoriesStockDropdown({super.key});

  @override
  State<CategoriesStockDropdown> createState() =>
      _CategoriesStockDropdownState();
}

class _CategoriesStockDropdownState
    extends BaseState<CategoriesStockDropdown, StockController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
        hint: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Categorias"),
        ),
        underline: Container(),
        isExpanded: true,
        value: controller.stockData.category,
        items: <DropdownMenuItem<int>>[
          DropdownMenuItem(
            value: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Matéria-prima",
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.6)  ), ),
            ),
          ),
          DropdownMenuItem(
            value: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Bens para varejo",
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.6) ),
              ),
            ),
          ),
          DropdownMenuItem(
            value: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Consumo interno",
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.6) ),
              ),
            ),
          ),
          DropdownMenuItem(
            value: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Estoque de segurança",
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.6) ),
              ),
            ),
          ),
        ],
        onChanged: ((newValue) {
          setState(() {
            controller.stockData = controller.stockData.copyWith(category: newValue);
            log("${controller.stockData.category}");
          });
        }),
      ),
    ); 
  }
}
