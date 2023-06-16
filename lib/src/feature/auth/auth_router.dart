import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/repositories/user/user_repository.dart';
import '../../core/repositories/user/user_repository_impl.dart';
import 'controller/auth_controller.dart';
import 'page/auth_page.dart';

class AuthRouter {
  AuthRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(client: context.read()),
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
