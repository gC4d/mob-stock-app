import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/data/controller/data_controller.dart';
import 'package:mob_storage_app/src/core/data/controller/data_controller_impl.dart';
import 'package:mob_storage_app/src/core/repositories/app/app_validations.dart';
import 'package:mob_storage_app/src/core/repositories/app/app_validations_impl.dart';
import 'package:mob_storage_app/src/core/repositories/group/group_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';
import 'package:mob_storage_app/src/core/services/synchronizer/synchronizer.dart';
import 'package:mob_storage_app/src/core/services/synchronizer/synchronizer_impl.dart';
import 'package:provider/provider.dart';
import '../repositories/group/group_repository_impl.dart';
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
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            client: context.read(),
          ),
        ),
        Provider<DataController>(
          create: (context) => DataControllerImpl(),
        ),
        Provider<StorageRepository>(
          create: (context) => StorageRepositoryImpl(
            client: context.read(),
            db: context.read(),
            userRepository: context.read(),
          ),
        ),
        Provider<GroupRepository>(
          create: (context) => GroupRepositoryImpl(context.read()),
        ),
        Provider<AppValidations>(
          create: (context) => AppValidationsImpl(
            context.read(),
            context.read(),
          ),
        ),
        Provider<Synchronizer>(
          create: (context) => SynchronizerImpl(
            storage: context.read(),
            client: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
