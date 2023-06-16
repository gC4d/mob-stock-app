import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mob_storage_app/src/core/exceptions/auth_exception.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late Box box;
  final RestClient client;
  UserRepositoryImpl({required this.client});

 
  @override
  Future<bool> checkforUserIsLogged() async {
    box = await Hive.openBox('UserBox');
    var user = await box.get('User');
    if (user == null) {
      log("User state: User is not logged");
      return false;
    } else {
      log("User state: User is logged");
      log("User info: $user");
      return true;
    }
  }

  @override
  Future<void> signUpUser(Map<String, dynamic> user) async {
    try {
      Response response = await client.unauth().post(
            '/user/create',
            data: user,
          );
      log('$response');
    } on DioError catch (e, s) {
      log('Erro ao criar usuário', error: e, stackTrace: s);
    }
  }

  @override
  Future<void> authUser(Map<String, dynamic> authUserDto) async {
    try {
      Response? user =
          await client.auth().get("/user/auth", data: authUserDto);
      box = await Hive.openBox('UserBox');
      await box.put('User', user.data);
    } on DioError catch (e, s) {
      log("Error in authUser method", error:  e, stackTrace:  s);
      throw AuthException(message: "Erro ao logar usuário");
    }
  }

  @override
  Future<void> signOutUser() async {
    box = await Hive.openBox('UserBox');
    await box.put('User', null);
  }

  @override
  Future<int> getUserid() async {
    try {
      box = await Hive.openBox('UserBox');
      var user = await box.get('User');
      int id = user["id"];
      return id;
    } catch (e) {
      log("Error in getUserId method");
    }
    return 0;
  }
  
  @override
  Future<String> getUserName() async {
    try{
      box = await Hive.openBox('UserBox');
      var user = await box.get('User');
      String name = user["name"];
      return name;
    } catch (e) {
      log("Error in getUserName method");
    }
    return 'Usuario';
  }
}
