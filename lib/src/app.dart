import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/application_binding/application_binding.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';

import 'feature/auth/auth_page.dart';
import 'feature/home/home_page.dart';
import 'feature/register/register_page.dart';
import 'feature/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashPage(),
          '/': (context) => HomePage(),
          '/register': (context) => RegisterPage(),
          '/auth': (context) => AuthPage(),
        },
      ),
    );
  }
}
