import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {

  const StockPage({ super.key });

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}