// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/exceptions/auth_exception.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';
import 'package:mob_storage_app/src/feature/auth/auth_dto.dart';
import 'package:mob_storage_app/src/feature/auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { idle, loading, success, error }

class AuthController extends ChangeNotifier implements AuthRepository {
  AuthDto auth = AuthDto(email: '', password: '');
  RestClient client = RestClient();
  AuthState state = AuthState.idle;

  @override
  Future<void> loginAction() async {
    state = AuthState.loading;
    notifyListeners();
    if(auth.email != "" && auth.password != ""){
    final shared = await SharedPreferences.getInstance();
    try {
       final respose = await client.unauth().post('/user/auth', data: auth.toJson());
       await shared.setString('UserLogged', respose.toString());
       state = AuthState.success;
       notifyListeners();
    } catch (e, s) {
      log("Erro ao logar usuário: ", error: e, stackTrace: s);
      state = AuthState.error;
      notifyListeners();
      throw AuthException(message: 'Erro ao logar usuário');
    }
    } else {
      log("Erro ao logar usuário: Email ou senha incorretos");
      state = AuthState.error;
      notifyListeners();
    }
  }
}


//var sharedData = jsonDecode(shared.getString('UserLogged').toString());
//log("data ${sharedData}");        
//log('resp $respose');