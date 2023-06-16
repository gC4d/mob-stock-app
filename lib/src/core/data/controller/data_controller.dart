
import '../database/database.dart';

abstract class DataController {
  Future<List<StockData>> getAllStocks();
  Future<List<StockData>> getNotSyncedStock();
  Future<int> setStockToSynced(int id);
  Future<void> createStock(StockCompanion stockEntity);
  Future<void> deleteAllStocks();
  Future<void> deleteStock(int id);
}