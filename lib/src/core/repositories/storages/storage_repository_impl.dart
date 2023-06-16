import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';

import '../../data/controller/data_controller.dart';
import './storage_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

class StorageRepositoryImpl implements StorageRepository {
  final RestClient client;
  final DataController db;
  final UserRepository userRepository;
  StorageRepositoryImpl(
      {required this.client, required this.db, required this.userRepository});

  // Sync Methods

  @override
  Future<void> syncStocks() async {
    try {
      List<StockData> stockData = await db.getNotSyncedStock();
      log("$stockData");
      int userId = await userRepository.getUserid();
      for (StockData element in stockData) {
        Map<String, dynamic> data = element.toJson();
        data.remove('sync');
        data.addAll({'user_id': userId});

        log("Syncing stock data: $data");
        log("Syncing stock data id: ${data['user_id']}");

        var respose = await client.auth().post(
              "/stock/create",
              data: data,
            );

        log("$respose");

        await db.setStockToSynced(data['id']);
      }
    } on DioError catch (e, s) {
      log('Erro ao criar estoque', error: e, stackTrace: s);
      throw Exception('Erro ao criar estoque');
    }
  }

  @override
  Future<void> syncFindAllStocks() async {
    List<StockData> localStocks = [];
    try {
      int userId = await userRepository.getUserid();
      Response user = await client.auth().get(
        "/stock/read/all",
        data: {"user_id": userId},
      );

      var syncStocks = user.data;

      localStocks = await localFindAllStocks();
      log("Response values: $syncStocks");
      log("Local values: $localStocks");
      for (var i in syncStocks) {
        if (checkForExistStock(localStocks, syncStocks) == 0 ||
            localStocks.isEmpty) {
          StockData stock = StockData(
            id: 0,
            description: i['description'],
            category: i['category'],
            amount: i['amount'],
            sync: 1,
          );
          await localCreateStock(stock);
        }
      }
    } on DioError catch (e, s) {
      log("Erro ao buscar estoques", error: e, stackTrace: s);
      throw Exception("Erro ao buscar estoques");
    }
  }

  @override
  Future<void> syncDeleteStock(Map<String, dynamic> storage) {
    // TODO: implement deleteStorage
    throw UnimplementedError();
  }

  @override
  Future<void> syncUpdateStock(Map<String, dynamic> storage) {
    // TODO: implement updateStorage
    throw UnimplementedError();
  }

  // Local Methods

  @override
  Future<void> localCreateStock(StockData stock) async {
    final entity = StockCompanion(
        description: Value(stock.description),
        category: Value(stock.category),
        amount: Value(stock.amount ?? 0),
        sync: Value(stock.sync));

    db.createStock(entity);
  }

  @override
  Future<void> localDeleteStock(int id) async {
    await db.deleteStock(id);
  }

  @override
  Future<List<StockData>> localFindAllStocks() async {
    List<StockData> stockData = await db.getAllStocks();

    return stockData;
  }

  @override
  Future<void> localUpdateStorage(Map<String, dynamic> storage) {
    // TODO: implement localUpdateStorage
    throw UnimplementedError();
  }

  int checkForExistStock(List<StockData> localStocks, var syncStocks) {
    for (var i in syncStocks) {
      for (var j in localStocks) {
        if (j.description == i['description'] && j.category == i['category']) {
          return 1;
        }
      }
    }
    return 0;
  }
  
  @override
  Future<void> localDeleteAllStocks() {
    // TODO: implement localDeleteAllStocks
    throw UnimplementedError();
  }
}
