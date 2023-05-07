
import 'package:mob_storage_app/src/core/data/database/database.dart';

import '../../dto/add_stock_dto.dart';
import '../../models/stock_model.dart';

abstract class StorageRepository {
  Future<void> syncStocks();
  Future<List<StockModel>> syncFindAllStocks(int userId);
  Future<void> syncUpdateStock(Map<String, dynamic> storage);
  Future<void> syncDeleteStock(Map<String, dynamic> storage);

  Future<void> localCreateStock(AddStockDto addStockDto);
  Future<List<StockData>> localFindAllStocks();
  Future<void> localUpdateStorage(Map<String, dynamic> storage);
  Future<void> localDeleteStorage(Map<String, dynamic> storage);
}