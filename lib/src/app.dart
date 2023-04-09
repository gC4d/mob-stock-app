import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/aplication_binding/aplication_binding.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';
import 'package:mob_storage_app/src/feature/auth/auth_router.dart';
import 'package:mob_storage_app/src/feature/splash/splash_page.dart';
import 'feature/home/home_router.dart';
import 'feature/signup/sign_up_router.dart';
import 'feature/stock/stock_router.dart';

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
          '/splash': (context) => const SplashPage(),
          '/signup': (context) => SignUpRouter.page,
          '/auth':(context) => AuthRouter.page,
          '/': (context) => HomeRouter.page,
          '/stock': (context) => StockRouter.page,
          '/add/stock': (context) => StockRouter.addPage,
        },
      ),
    );
  }
}
