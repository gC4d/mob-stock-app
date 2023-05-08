import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    final mRoute = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> tools = mRoute as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(tools["stock_description"]),
      ),
      body: Container(),
    );
  }
}
