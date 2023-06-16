import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => HomeController(
              context.read(),
              context.read(),
              context.read(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
