import '../../data/database/database.dart';

abstract class GroupRepository {
  Future<void> createGroup(GroupData stock);
  Future<List<GroupData>> localFindAllStocks();
  Future<void> localUpdateStorage(Map<String, dynamic> storage);
  Future<void> localDeleteStock(int id);
  Future<void> localDeleteAllStocks();
}