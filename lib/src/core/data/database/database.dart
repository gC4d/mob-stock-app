import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../entities/product_entity.dart';
import '../entities/stock_entity.dart';
import '../entities/group_entity.dart';
import '../entities/permission_entity.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'mobStock.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Group, Stock, Product, Permissions])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
