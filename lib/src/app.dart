import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/aplication_binding/aplication_binding.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';
import 'package:mob_storage_app/src/feature/signup/sign_up_page.dart';
import 'package:mob_storage_app/src/feature/splash/splash_page.dart';
import 'feature/home/home_router.dart';
import 'feature/signup/sign_up_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeRouter.page,
          '/splash': (context) => const SplashPage(),
          '/signup': (context) => SignUpRouter.page
        },
      ),
    );
  }
}
