import 'package:flutter/widgets.dart';

abstract class RoutesRepository {
  Future<void> goTo(BuildContext context, String route, [Map<String, dynamic>? arguments]);
  Future<void> back(BuildContext context);
}
