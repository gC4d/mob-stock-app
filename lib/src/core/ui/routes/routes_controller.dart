import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes_repository.dart';

class RoutesController implements RoutesRepository {
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

extension RoutesExtensions on BuildContext {
  void goTo(String route) => RoutesController().goTo(this, route);
  void back() => RoutesController().back(this);
}
