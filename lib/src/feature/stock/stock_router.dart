import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/add_stock_page.dart';
import 'stock_controller.dart';
import 'stock_page.dart';

class StockRouter {
  StockRouter._();

   static Widget get addPage => MultiProvider(
        providers: [
          Provider(create: (context) => StockController(context.read(), context.read()))
        ],
        child: const  AddStockPage(),
      );

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => StockController(
              context.read(),
              context.read(),
            ),
          )
        ],
        child: const StockPage(),
      );
}
