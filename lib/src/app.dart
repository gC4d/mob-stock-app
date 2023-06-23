import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/aplication_binding/aplication_binding.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: Routes.VALIDATION,
        routes: Routes.routes,
      ),
    );
  }
}
