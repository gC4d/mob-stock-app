import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/feature/stock/widgets/custom_fab/expanded_fab.dart';

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
        title: Text("teste"),
      ),
      body: Container(),
      floatingActionButton: ExpandedFab()
    );
  }
}
