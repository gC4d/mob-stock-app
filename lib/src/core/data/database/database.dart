import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../entities/product_entity.dart';
import '../entities/stock_entity.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'mobStock.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Stock, Product])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<StockData>> getStocks() async {
    return await select(stock).get();
  }

  Future<List<StockData>> getNotSyncedStock() async {
    return await (select(stock)..where((tbl) => tbl.sync.equals(0))).get();
  }

  Future<int> setStockToSynced(int id) async {
    log("$id");

    return (update(stock)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .write(
      const StockCompanion(sync: Value(1)),
    );
  }

  Future<int> insertStock(StockCompanion stockEntity) async {
    return await into(stock).insert(stockEntity);
  }
}
