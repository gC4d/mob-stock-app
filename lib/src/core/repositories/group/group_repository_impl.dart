//import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mob_storage_app/src/core/data/controller/data_controller.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';
import 'package:mob_storage_app/src/core/data/dto/group_dto.dart';
import 'package:mob_storage_app/src/core/repositories/cryptography/cryptography_repository.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

import './group_repository.dart';

class GroupRepositoryImpl implements GroupRepository {
  final DataController _database;

  final RestClient _client;

  GroupRepositoryImpl(this._database, this._client);

  @override
  Future<void> localCreateGroup(GroupCompanion group) async {
    try {
      await _database.createGroup(group);
    } catch (e) {
      log('error in GroupRepositoryImpl.localCreateGroup()');
      log(e.toString());
      log(StackTrace.current.toString());
    }
  }

  @override
  Future<List<GroupData>> localGetAllGroups() async {
    List<GroupData> groups = [];
    try {
      groups = await _database.getAllGroups();
      return groups;
    } catch (e) {
      log('error in GroupRepositoryImpl.localGetAllGroup()');
      log(e.toString());
      log(StackTrace.current.toString());
    }
    return groups;
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
  Future<void> localUpdateStorage(Map<String, dynamic> storage) {
    // TODO: implement localUpdateStorage
    throw UnimplementedError();
  }

  @override
  Future<void> syncCreateGroup(GroupDTO groupDTO) async {
    try {
      Response resCreateGroup =
          await _client.auth().post('/group/create', data: {
        'user_id': 1, // alterar depois
        'description': groupDTO.description,
        'key': groupDTO.key,
        'password': groupDTO.password,
      });

      Response resCreateAccess =
          await _client.auth().post('/group/add/access', data: {
        'user_id': 1, // alterar depois]
        'group_id': resCreateGroup.data['id'],
        'access': 1
      });

      Response resCreatePermissions =
          await _client.auth().post('/group/create/permission', data: {
            'user_id': 1, // alterar depois
            'group_id': resCreateGroup.data['id'],
            'p_add_remove': 1,
            'p_create': 1,
            'p_delete': 1,
            'is_adm': 1,
          });
      log(resCreateGroup.data.toString());
    } catch (e) {
      log('error in GroupRepositoryImpl.syncCreateGroup()');
      log(e.toString());
      log(StackTrace.current.toString());
    }
  }

  @override
  Future<void> syncDeleteAllStocks() {
    // TODO: implement syncDeleteAllStocks
    throw UnimplementedError();
  }

  @override
  Future<void> syncDeleteStock(int id) {
    // TODO: implement syncDeleteStock
    throw UnimplementedError();
  }

  @override
  Future<List<GroupData>> syncGetAllGroups() {
    // TODO: implement syncGetAllGroups
    throw UnimplementedError();
  }

  @override
  Future<void> syncUpdateStorage(Map<String, dynamic> storage) {
    // TODO: implement syncUpdateStorage
    throw UnimplementedError();
  }
}
