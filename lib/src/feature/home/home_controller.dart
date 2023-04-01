import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';
import 'package:mob_storage_app/src/feature/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  final UserRepository _userRepository;

  HomeController(
    this._userRepository,
  ) : super(const HomeState.initial());

  Future<void> checkUser() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      bool isLogged = await _userRepository.checkforUserIsLogged();

      if (isLogged) {
        emit(
          state.copyWith(
            status: HomeStateStatus.success,
            isLogged: isLogged,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: HomeStateStatus.notLogged,
            isLogged: isLogged,
          ),
        );
      } 
    } catch (e, s) {
      log("Erro ao verificar se usuário está logado", error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: "Erro ao verificar se usuário está logado",
        ),
      );
    }
  }
}
