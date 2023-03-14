import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/widgets/custom_drawer.dart';

import 'widgets/custom_home_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          'Mobile Storage',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomHomeButton(
                width: context.percentWidth(.9),
                height: context.percentHeight(.1),
                label: "Estoques",
                icon: Icons.storage_rounded,
                function: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomHomeButton(
                width: context.percentWidth(.9),
                height: context.percentHeight(.1),
                label: "Produtos",
                icon: Icons.shopping_cart_outlined,
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
