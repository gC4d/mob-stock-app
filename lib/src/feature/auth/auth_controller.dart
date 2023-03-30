import 'package:bloc/bloc.dart';
import 'package:mob_storage_app/src/feature/auth/dto/auth_dto.dart';

import '../../core/repositories/user/user_repository.dart';
import '../auth/auth_state.dart';

class AuthController extends Cubit<AuthState> {
  final UserRepository _userRepository;
  late AuthDto authDto;
  AuthController(
    this._userRepository,
  ) : super(const AuthState.initial());

  Future<void> loginAction() async {
    emit(state.copyWith(status: AuthStateStatus.loading));
    try {
      _userRepository.authUser(authDto.toMap());
      emit(state.copyWith(status: AuthStateStatus.success));
    } catch (e, s) {
      emit(
        state.copyWith(
            status: AuthStateStatus.error,
            errorMessage: "Erro ao tentar logar usuário"),
      );
    }
  }
}
