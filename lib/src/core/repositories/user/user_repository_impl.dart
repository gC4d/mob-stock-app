import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late Box box;
  final RestClient client;
  UserRepositoryImpl({required this.client}) {
    init();
  }

  @override
  Future<void> init() async {
    box = await Hive.openBox('UserBox');
  }

  @override
  Future<bool> checkforUserIsLogged() async {
    box = await Hive.openBox('UserBox');
    Map<String, dynamic> user = await box.get('User');
    if (user == null) {
      log("Usuário não logado");
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> signUpUser(Map<String, dynamic> user) async {
    try {
      Response response = await client.unauth().post(
            '/user/register',
            data: user,
          );
      log('$response');
    } on DioError catch (e, s) {
      log('Erro ao criar usuário', error: e, stackTrace: s);
    }
  }

  @override
  Future<Map<String, dynamic>> authUser(Map<String, dynamic> user) async {
    box = await Hive.openBox('UserBox');
    if (user.isNotEmpty) {
      await box.put('User', user);
      return user;
    } else {
      return {};
    }
  }

  @override
  Future<void> signOutUser() async {
    box = await Hive.openBox('UserBox');
    await box.put('User', null);
  }
}
