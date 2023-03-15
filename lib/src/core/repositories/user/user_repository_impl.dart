
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import './user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  late Box box;
  UserRepositoryImpl() {
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
  Future<void> signUpUser() async {
    box = await Hive.openBox('UserBox');
    await box.put('User', null);
  }
}
