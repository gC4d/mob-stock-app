import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';
import 'package:provider/provider.dart';

import '../repositories/storages/storage_repository.dart';
import '../repositories/storages/storage_repository_impl.dart';
import '../repositories/user/user_repository.dart';
import '../repositories/user/user_repository_impl.dart';

class AplicationBinding extends StatelessWidget {
  final Widget child;
  const AplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => RestClient()),
        Provider(create: (context) => AppDb()),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            client: context.read(),
          ),
        ),
        Provider<StorageRepository>(
          create: (context) => StorageRepositoryImpl(
            client: context.read(),
            db: context.read(),
            userRepository: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
