
import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/feature/signup/sign_up_controller.dart';
import 'package:mob_storage_app/src/feature/signup/sign_up_page.dart';
import 'package:provider/provider.dart';

import '../../core/repositories/user/user_repository.dart';
import '../../core/repositories/user/user_repository_impl.dart';
import 'auth_controller.dart';
import 'auth_page.dart';

class AuthRouter {
  AuthRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(
              client: context.read()
            ),
          ),
          Provider(
            create: (context) => AuthController(
              context.read(),
            ),
          ),
        ],
        child: const AuthPage(),
      );
}
