import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';
import 'package:mob_storage_app/src/feature/splash/splash_page.dart';
import 'feature/home/home_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeRouter.page,
        '/splash': (context) => const SplashPage()
      },
    );
  }
}
