// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';
import 'package:mob_storage_app/src/feature/register/register_user_dto.dart';
import 'package:mob_storage_app/src/feature/register/repository/register_repository.dart';
import '/src/core/exceptions/auth_exception.dart';

enum RegisterState { idle, loading, success, error}

class RegisterController extends ChangeNotifier{
  RestClient client = RestClient();
  var state = RegisterState.idle;

  RegisterUserDto user = RegisterUserDto(
    name: "",
    email: "",
    password: "",
  );
  String confirmPassword = '';

  
  Future<void> registerAction() async {
    state = RegisterState.loading;
    notifyListeners();
    if (user.password == confirmPassword && user.email != "") {
      try {
        await client.unauth().post('/user/register', data: user.toJson());
        state = RegisterState.success;
        notifyListeners();
      } catch (e, s) {
        log("Erro ao cadastrar usuário: ", error: e, stackTrace: s);
        state = RegisterState.error;
        notifyListeners();
        throw AuthException(message: "Erro ao cadastrar usuário");
      }
    } else {
      state = RegisterState.error;
      notifyListeners();
      log('$state');
    }
  }
}
