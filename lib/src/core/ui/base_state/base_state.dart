import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}