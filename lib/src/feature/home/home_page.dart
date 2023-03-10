import 'package:flutter/material.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Mobile Storage'),
      ),
      body: Container(),
    );
  }
}
