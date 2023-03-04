import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob_storage_app/src/feature/auth/auth_page.dart';
import '../../feature/register/register_page.dart';
import '../../feature/splash/splash_page.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/splash',
          child: (context, args) => const SplashPage(),
        ),
        ChildRoute(
          '/auth',
          child: (context, args) => const AuthPage(),
        ),
        ChildRoute(
          '/register',
          child: (context, args) => const RegisterPage(),
        ),
      ];
}
