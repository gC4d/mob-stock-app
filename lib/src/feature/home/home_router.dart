
import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/feature/home/home_controller.dart';
import 'package:mob_storage_app/src/feature/home/home_page.dart';
import 'package:provider/provider.dart';

import '../../core/repositories/user/user_repository.dart';
import '../../core/repositories/user/user_repository_impl.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(),
          ),
          Provider(
            create: (context) => HomeController(
              context.read(),
            ),
          ),
        ],
        child: const HomePage(),
      );
}
