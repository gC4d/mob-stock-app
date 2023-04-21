import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/models/user_model.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';
import 'sign_up_state.dart';

class SignUpController extends Cubit<SignUpState> {
  final UserRepository _userRepository;
  late UserModel user = UserModel(name: "", email: "", password: "");
  late String confirmPassword = '';

  SignUpController(
    this._userRepository,
  ) : super(const SignUpState.initial());

  Future<void> createUser() async {
    if (user.name != "" && user.email != "" && user.password != "") {
      if (user.password == confirmPassword) {
        emit(state.copyWith(status: SignUpStateStatus.loading));
        try {
          await _userRepository.signUpUser(user.toMap());
          emit(state.copyWith(status: SignUpStateStatus.success));
        } catch (e, s) {
          log("Erro ao efetuar cadastro de usuário: ", error: e, stackTrace: s);
          emit(state.copyWith(
            status: SignUpStateStatus.error,
            errorMessage: "Erro ao efetuar cadastro de usuário",
          ));
        }
      } else {
        emit(state.copyWith(
          status: SignUpStateStatus.error,
          errorMessage: "Senhas não conferem",
        ));
      }
    } else {
      emit(state.copyWith(
        status: SignUpStateStatus.error,
        errorMessage: "Por favor preencha todos os campos"
      ));
    }
  }
}
