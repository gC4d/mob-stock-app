
import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/feature/signup/page/sign_up_page.dart';
import 'package:provider/provider.dart';

import '../../core/repositories/user/user_repository.dart';
import '../../core/repositories/user/user_repository_impl.dart';
import './controller/sign_up_controller.dart';

class SignUpRouter {
  SignUpRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(
              client: context.read()
            ),
          ),
          Provider(
            create: (context) => SignUpController(
              context.read(),
            ),
          ),
        ],
        child: const SignUpPage(),
      );
}
