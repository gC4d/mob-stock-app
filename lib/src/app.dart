import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob_storage_app/src/core/application_binding/application_binding.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';

import 'feature/home/home_page.dart';
import 'feature/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash');

    return ApplicationBinding(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
