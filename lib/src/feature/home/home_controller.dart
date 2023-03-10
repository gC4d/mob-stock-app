import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum HomeState { idle, loading, success, error }

enum UserState { logged, notLogged }

class HomeController extends ChangeNotifier {
  var userState = UserState.notLogged;
  var state = HomeState.idle;

  Future<void> checkForUserIsLogged() async {
    state = HomeState.loading;
    notifyListeners();
    final shared = await SharedPreferences.getInstance();
    try {
      var sharedData = jsonDecode(shared.getString('UserLogged').toString());
      log(sharedData);
      if (sharedData != null) {
        userState = UserState.logged;
        state = HomeState.success;
        notifyListeners();
      } else {
        userState = UserState.notLogged;
        state = HomeState.success;
        notifyListeners();
      }
    } catch (e, s) {
      log("Erro ao verificar se usuário está logado", error: e, stackTrace: s);
      state = HomeState.error;
      notifyListeners();
    }
  }
}
