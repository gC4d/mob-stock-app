// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';

import 'package:mob_storage_app/src/core/models/user_model.dart';
import 'package:mob_storage_app/src/feature/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  final UserModel _user;

  HomeController(
    this._user,
  ) : super(const HomeState.initial());
  
}
