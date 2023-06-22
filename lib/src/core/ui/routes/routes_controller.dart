import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes_repository.dart';

mixin RoutesController <T extends StatefulWidget> on State<T> implements RoutesRepository {
  @override
  Future<void> back(BuildContext context) async {
    try {
      Navigator.of(context).pop();
    } catch (e) {
       log(e.toString());
      log(StackTrace.current.toString());
    }
    
  }

  @override
  Future<void> goTo(BuildContext context, String route,
      [Map<String, dynamic>? arguments]) async {
    try {
      await Navigator.of(context).popAndPushNamed(route, arguments: arguments);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
    }
  }
}
