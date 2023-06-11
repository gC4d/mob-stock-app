import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/repositories/app/app_validations.dart';
import 'package:mob_storage_app/src/feature/validation/validation_state.dart';

class ValidationController extends Cubit<ValidationState> {
  final AppValidations _appValidations;
  ValidationController(this._appValidations)
      : super(const ValidationState.initial());

  Future<void> userValidation() async {
    emit(state.copyWith(status: ValidationStateStatus.loading));
    try {
      await _appValidations.checkIfIsLogged()
          ? emit(state.copyWith(status: ValidationStateStatus.userLogged))
          : emit(state.copyWith(status: ValidationStateStatus.userLogged));
    } catch (e) {
      emit(
        state.copyWith(
            status: ValidationStateStatus.error,
            errorMessage: 'Error in check if user is logged'),
      );
      log('error in ValidationController.userValidation() method', error: e);
    }
  }
}
