// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:mob_storage_app/src/core/repositories/group/group_repository.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';

import './app_validations.dart';

class AppValidationsImpl implements AppValidations {
  final UserRepository _userRepository;
  final GroupRepository _groupRepository;

  const AppValidationsImpl(
    this._userRepository,
    this._groupRepository,
  );
  @override
  Future<bool> checkIfIsLogged() async {
    try {
      bool isLogged = await _userRepository.checkforUserIsLogged();
      return isLogged;
    } catch (e) {
      log('Error in check user is logged:', error: e );
    }
    return false;
  }

  @override
  Future<bool> checkIfUserHasGroups() {
    // TODO: implement checkIfUserHasGroups
    throw UnimplementedError();
  }

}
