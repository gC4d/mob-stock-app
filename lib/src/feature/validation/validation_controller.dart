import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';
import 'package:mob_storage_app/src/core/repositories/group/group_repository.dart';
import 'package:mob_storage_app/src/core/repositories/user/user_repository.dart';
import 'package:mob_storage_app/src/core/services/synchronizer/synchronizer.dart';
import 'package:mob_storage_app/src/feature/validation/validation_state.dart';

class ValidationController extends Cubit<ValidationState> {
  final UserRepository _userRepository;
  final GroupRepository _groupRepository;
  final Synchronizer _sync;

  ValidationController(this._userRepository, this._groupRepository, this._sync)
      : super(const ValidationState.initial());

  Future<void> appValidations() async {
    log("Initialize app validations...");
    emit(state.copyWith(status: ValidationStateStatus.loading));
    await userValidation();
    await checkIfUserHaveGroups();

    emit(state.copyWith(status: ValidationStateStatus.sucess));
    log("Finish app validations");
  }

  Future<void> synchronizer() async {
    log("Initialize synchronization");
    emit(state.copyWith(status: ValidationStateStatus.loading));
    await _sync.checkForNetworkConnection();
    await _sync.checkForServerOn();
    log("Finish synchronization");
  }

  Future<void> userValidation() async {
    log('initialize a validation if user is logged...');
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

  Future<void> checkIfUserHaveGroups() async {
    log('initialize a validation if user have groups...');
    List<GroupData> _groups = [];
    try {
      _groups = await _groupRepository.localGetAllGroups();
      if (_groups.isNotEmpty) {
        emit(state.copyWith(hasGroups: true));
        log('hasGroups state: true');
      } else {
        emit(state.copyWith(hasGroups: false));
        log('hasGroups state: false');
      }
    } catch (e) {
      emit(
        state.copyWith(
            status: ValidationStateStatus.error,
            errorMessage: 'Error in check if user have groups'),
      );
      log('error in ValidationController.checkIfUserHaveGroups() method',
          error: e);
    }
  }
}
