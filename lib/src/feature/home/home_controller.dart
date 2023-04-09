import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/repositories/storages/storage_repository.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';
import 'package:mob_storage_app/src/feature/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;

  HomeController(
    this._userRepository,
    this._storageRepository,
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

  Future<void> logoutUser() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      await _userRepository.signOutUser();
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
      log("Erro ao deslogar usuário", error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: "Erro ao deslogar usuário",
        ),
      );
    }
  }

  Future<void> getStocks() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    if(state.isLogged){
       try {
      var id = await _userRepository.getUserid();
      final stocks = await _storageRepository.findAllStocks(id);
      emit(
        state.copyWith(
          status: HomeStateStatus.success,
          stocks: stocks,
        ),
      );
    } catch (e, s) {
      log('Erro ao buscar estoques', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar estoques'),
      );
    }
    }
  }
}
