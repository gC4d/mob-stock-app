import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';
import 'package:mob_storage_app/src/feature/validation/validation_state.dart';

class ValidationController extends Cubit<ValidationState> {
  final UserRepository _userRepository;
  ValidationController(this._userRepository)
      : super(const ValidationState.initial());

  
  Future<void> userValidation() async {
    log('initialize a user validation...');
    try {
      bool userIsLogged = await _userRepository.checkforUserIsLogged();
      emit(state.copyWith(
        isLogged: userIsLogged,
      ));
    } catch (e) {
      emit(
        state.copyWith(
            status: ValidationStateStatus.error,
            errorMessage: 'Error in check if user is logged'),
      );
      log('error in ValidationController.userValidation() method', error: e);
    }
  }
  Future<void> groupValidation() async {
    try {
    } catch (e) {
      
    }
  }

}
