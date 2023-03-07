import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/messages.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> with Messages{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}