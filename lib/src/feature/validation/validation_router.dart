import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'validation_controller.dart';
import 'validation_page.dart';


class ValidationRouter {
  ValidationRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ValidationController(
              context.read(),
              context.read(),
              context.read(),
            ),
          )
        ],
        child: const ValidationPage(),
      );
}
