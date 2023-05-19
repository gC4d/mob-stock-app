import 'package:flutter/material.dart';

import 'fab_verticcal_delegate.dart';

class ExpandedFab extends StatefulWidget {
  const ExpandedFab({super.key});

  @override
  State<ExpandedFab> createState() => _ExpandedFabState();
}

class _ExpandedFabState extends State<ExpandedFab>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  final _isOpen = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    animation.dispose();
  }

  _toggle() {
    _isOpen.value ? animation.reverse() : animation.forward();
    _isOpen.value = !_isOpen.value;
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      clipBehavior: Clip.none,
      delegate: FabVerticcalDelegate(animation: animation),
      children: [
        FloatingActionButton(
          heroTag: const Text('btn0'),
          onPressed: () => _toggle(),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: animation,
              size: 25,
            ),
        ),
        FloatingActionButton(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
          ),
          heroTag: const Text('btn1'),
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
          ),
          heroTag: const Text('btn2'),
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.bar_chart_rounded),
        ),
        FloatingActionButton(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
          ),
          heroTag: const Text('btn3'),
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.view_in_ar_rounded),
        ),
      ],
    );
  }
}
