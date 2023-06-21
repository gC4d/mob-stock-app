// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../feature/auth/auth_router.dart';
import '../../../feature/group/group_router.dart';
import '../../../feature/home/home_router.dart';
import '../../../feature/signup/sign_up_router.dart';
import '../../../feature/splash/splash_page.dart';
import '../../../feature/stock/stock_router.dart';
import '../../../feature/validation/validation_router.dart';

class Routes {
  static String get HOME => '/home';
  static String get VALIDATION => '/validation';
  static String get GROUP => '/group';
  static String get AUTH => '/auth';
  static String get SIGN_UP => '/signup';
  static String get SPLASH => '/splash';
  static String get ADD_STOCK => '/add/stock';
  static String get ADD_PRODUCT => '/add/product';
  static String get STOCK_AUDIT => '/stock/audit';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.SPLASH: (context) => const SplashPage(),
    Routes.SIGN_UP: (context) => SignUpRouter.page,
    Routes.AUTH: (context) => AuthRouter.page,
    Routes.GROUP: (context) => GroupRouter.page,
    Routes.HOME: (context) => HomeRouter.page,
    '/stock': (context) => StockRouter.page,
    Routes.ADD_STOCK: (context) => StockRouter.addPage,
    Routes.VALIDATION: (context) => ValidationRouter.page,
  };
}
