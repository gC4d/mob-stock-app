import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';
import 'package:mob_storage_app/src/core/dto/add_stock_dto.dart';
import 'package:mob_storage_app/src/core/models/stock_model.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';

import './storage_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

class StorageRepositoryImpl implements StorageRepository {
  final RestClient client;
  final AppDb db;
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
          log("syncing stock data: $data");
          log("syncing stock data: ${data['user_id']}");

          var respose = await client.auth().post(
                "/stock/create",
                data: data,
              );
          log("$respose");
          await db.setStockToSynced(data['id']);
      }
    } on DioError catch (e, s) {
      log('Erro ao criar estoque', error: e, stackTrace: s);
      throw Exception();
    }
  }

  @override
  Future<List<StockModel>> syncFindAllStocks(int userId) async {
    try {
      Response user = await client.auth().get(
        "/stock/read/all",
        data: {"user_id": userId},
      );

      var dataObject = user.data;
      log("Response values: $dataObject");

      List<StockModel> stocks = [];

      for (var element in dataObject) {
        stocks.add(
          StockModel.fromMap(element),
        );
      }
      return stocks;
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
  Future<void> localCreateStock(AddStockDto addStockDto) async {
    final entity = StockCompanion(
      description: Value(addStockDto.description),
      category: Value(addStockDto.category),
      amount: const Value(0),
      sync: const Value(0)
    );

    db.insertStock(entity);
  }

  @override
  Future<void> localDeleteStorage(Map<String, dynamic> storage) {
    // TODO: implement localDeleteStorage
    throw UnimplementedError();
  }

  @override
  Future<List<StockData>> localFindAllStocks() async {
    List<StockData> stockData = await db.getStocks();

    return stockData;
  }

  @override
  Future<void> localUpdateStorage(Map<String, dynamic> storage) {
    // TODO: implement localUpdateStorage
    throw UnimplementedError();
  }
}
