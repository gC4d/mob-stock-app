import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/feature/stock/controller/stock_controller.dart';

import '../../../core/ui/base_state/base_state.dart';

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
        items: const <DropdownMenuItem<int>>[
          DropdownMenuItem(
            value: 0,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Matéria-prima",
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ),
          DropdownMenuItem(
            value: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Bens para varejo",
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ),
          DropdownMenuItem(
            value: 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Consumo interno",
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ),
          DropdownMenuItem(
            value: 3,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Estoque de segurança",
                style: TextStyle(color: Colors.white60),
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
