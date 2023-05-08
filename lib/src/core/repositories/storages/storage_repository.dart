
import 'package:mob_storage_app/src/core/data/database/database.dart';
abstract class StorageRepository {
  Future<void> syncStocks();
  Future<void> syncFindAllStocks();
  Future<void> syncUpdateStock(Map<String, dynamic> storage);
  Future<void> syncDeleteStock(Map<String, dynamic> storage);

  Future<void> localCreateStock(StockData stock);
  Future<List<StockData>> localFindAllStocks();
  Future<void> localUpdateStorage(Map<String, dynamic> storage);
  Future<void> localDeleteStorage(Map<String, dynamic> storage);
}