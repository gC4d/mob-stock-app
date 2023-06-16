// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';

import 'data_controller.dart';

class DataControllerImpl extends AppDb implements DataController {

  @override
  Future<void> deleteAllStocks() async {
    await (delete(stock)..where((tbl) => tbl.sync.equals(1))).go();
  }

  @override
  Future<List<StockData>> getAllStocks() async {
    return await select(stock).get();
  }

  @override
  Future<List<StockData>> getNotSyncedStock() async {
    return await (select(stock)..where((tbl) => tbl.sync.equals(0))).get();
  }

  @override
  Future<void> createStock(StockCompanion stockEntity) async{
    await into(stock).insert(stockEntity);
  }

  @override
  Future<int> setStockToSynced(int id) async {
    return await (update(stock)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .write(
      const StockCompanion(sync: Value(1)),
    );
  }
  
  @override
  Future<void> deleteStock(int id) async {
    delete(stock).where((tbl) => tbl.id.equals(id));
  }
  

}
