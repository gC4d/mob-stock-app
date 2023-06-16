import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/aplication_binding/aplication_binding.dart';
import 'package:mob_storage_app/src/core/ui/routes/routes.dart';
import 'package:mob_storage_app/src/core/ui/styles/themes.dart';
import 'package:mob_storage_app/src/feature/auth/auth_router.dart';
import 'package:mob_storage_app/src/feature/splash/splash_page.dart';
import 'package:mob_storage_app/src/feature/validation/validation_page.dart';
import 'package:mob_storage_app/src/feature/validation/validation_router.dart';
import 'feature/group/group_router.dart';
import 'feature/home/home_router.dart';
import 'feature/signup/sign_up_router.dart';
import 'feature/stock/stock_router.dart';

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
        routes: {
          Routes.SPLASH: (context) => const SplashPage(),
          Routes.SIGN_UP : (context) => SignUpRouter.page,
          Routes.AUTH:(context) => AuthRouter.page,
          Routes.GROUP: (context) => GroupRouter.page, 
          Routes.HOME: (context) => HomeRouter.page,
          '/stock': (context) => StockRouter.page,
          Routes.ADD_STOCK: (context) => StockRouter.addPage,
          Routes.VALIDATION: (context) => ValidationRouter.page,
        },
      ),
    );
  }
}
