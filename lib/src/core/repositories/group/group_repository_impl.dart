import 'package:mob_storage_app/src/core/data/controller/data_controller.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';

import './group_repository.dart';

class GroupRepositoryImpl implements GroupRepository {
  final DataController _database;

  GroupRepositoryImpl(this._database);


  @override
  Future<void> createGroup(GroupData stock) {
    // TODO: implement createGroup
    throw UnimplementedError();
  }

  @override
  Future<void> localDeleteAllStocks() {
    // TODO: implement localDeleteAllStocks
    throw UnimplementedError();
  }

  @override
  Future<void> localDeleteStock(int id) {
    // TODO: implement localDeleteStock
    throw UnimplementedError();
  }

  @override
  Future<List<GroupData>> localFindAllStocks() {
    // TODO: implement localFindAllStocks
    throw UnimplementedError();
  }

  @override
  Future<void> localUpdateStorage(Map<String, dynamic> storage) {
    // TODO: implement localUpdateStorage
    throw UnimplementedError();
  }

}