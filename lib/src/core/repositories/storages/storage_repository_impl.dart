import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/models/stock_model.dart';

import './storage_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

class StorageRepositoryImpl implements StorageRepository {
  final RestClient client;
  StorageRepositoryImpl({required this.client});

  @override
  Future<void> createStorage(Map<String, dynamic> storage) async {
    try {
      var respose = await client.auth().post(
            "/stock/create",
            data: storage,
          );
      log("$respose");
    } on DioError catch (e, s) {
      log('Erro ao criar estoque', error: e, stackTrace: s);
      throw Exception();
    }
  }

  @override
  Future<List<StockModel>> findAllStocks(int userId) async {
    try {
      Response user = await client.auth().get(
        "/stock/read/all",
        data: {"id_user": userId},
      );
      
      List<dynamic> dataObject = user.data;
      late List<StockModel> stocks = [];
      log("${dataObject.runtimeType}");
      for (var element in dataObject) {
        log("${element.runtimeType}");
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
  Future<void> deleteStorage(Map<String, dynamic> storage) {
    // TODO: implement deleteStorage
    throw UnimplementedError();
  }

  @override
  Future<void> updateStorage(Map<String, dynamic> storage) {
    // TODO: implement updateStorage
    throw UnimplementedError();
  }
}
