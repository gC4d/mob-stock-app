import 'dart:developer';
import 'package:dio/dio.dart';

import './storage_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

class StorageRepositoryImpl implements StorageRepository {
  final RestClient client;

  StorageRepositoryImpl({required this.client});

  @override
  Future<void> createStorage(Map<String, dynamic> storage) async {
    try {
      var respose = client.auth().post(
            "/storage/create",
            data: storage,
          );
      log("$respose");
    } on DioError catch (e, s) {
      log('Erro ao criar usuário', error: e, stackTrace: s);
    }
  }

  @override
  Future<void> deleteStorage(Map<String, dynamic> storage) {
    // TODO: implement deleteStorage
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getStorage(Map<String, dynamic> user) {
    // TODO: implement getStorage
    throw UnimplementedError();
  }

  @override
  Future<void> updateStorage(Map<String, dynamic> storage) {
    // TODO: implement updateStorage
    throw UnimplementedError();
  }
}
