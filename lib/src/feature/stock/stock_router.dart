import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../core/repositories/storages/storage_repository.dart';
import '../../core/repositories/storages/storage_repository_impl.dart';
import '../../core/repositories/user/user_repository.dart';
import '../../core/repositories/user/user_repository_impl.dart';
import 'page/add_stock_page.dart';
import 'controller/stock_controller.dart';
import 'page/stock_page.dart';

class StockRouter {
  StockRouter._();

    static Widget get page => MultiProvider(
        providers: [
          Provider<StorageRepository>(
            create: (context) => StorageRepositoryImpl(
              client: context.read(),
            ),
          ),
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(
              client: context.read(),
            ),
          ),
          Provider(create: (context) => StockController(
            context.read(), context.read()
          ))
        ],
        child: const StockPage(),
      );

  static Widget get addPage => MultiProvider(
        providers: [
          Provider<StorageRepository>(
            create: (context) => StorageRepositoryImpl(
              client: context.read(),
            ),
          ),
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(
              client: context.read(),
            ),
          ),
          Provider(create: (context) => StockController(
            context.read(), context.read()
          ))
        ],
        child: const  AddStockPage(),
      );
}
