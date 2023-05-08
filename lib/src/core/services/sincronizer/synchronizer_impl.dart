// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mob_storage_app/src/core/repositories/storages/storage_repository.dart';

import './synchronizer.dart';

class SynchronizerImpl implements Synchronizer {
  final StorageRepository storage;
  const SynchronizerImpl({
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

}
