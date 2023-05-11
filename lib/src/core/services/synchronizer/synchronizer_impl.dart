import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:mob_storage_app/src/core/repositories/storages/storage_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

import './synchronizer.dart';

class SynchronizerImpl implements Synchronizer {
  final StorageRepository storage;
  final RestClient client;
  const SynchronizerImpl({
    required this.client,
    required this.storage,
  });

  @override
  Future<void> SynchronizeData() async {
    
  }
  
  @override
  Future<void> SynchronizeProducts() {
    // TODO: implement SynchronizeProducts
    throw UnimplementedError();
  }
  
  @override
  Future<void> SynchronizeStocks() async {
    try {
      await storage.syncStocks();
      await storage.syncFindAllStocks();
    } catch (e, s) {
      log("Erro: ", error: e, stackTrace: s);
    }
  }
  
  @override
  Future<int> checkForNetworkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      return 0;
    }
    return 1;
  }
  
  @override
  Future<int> checkForServerOn() async {
    try {
      Response res = await client.auth().get('/server');
      if(res.statusCode == 200){
        log("Server on");
        return 1;
      }
    } catch (e) {
      log("Server off");
      return 0;
    }
    log("Server off");
    return 0;
  }

}
