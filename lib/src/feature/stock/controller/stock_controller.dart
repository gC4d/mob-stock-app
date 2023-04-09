import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mob_storage_app/src/core/repositories/storages/storage_repository.dart';
import 'package:mob_storage_app/src/core/dto/add_stock_dto.dart';
import 'package:mob_storage_app/src/feature/stock/controller/stock_state.dart';

import '../../../core/repositories/user/user_repository.dart';

class StockController extends Cubit<StockState> {
  final StorageRepository _storageRepository;
  final UserRepository _userRepository;
  late AddStockDto addStockDto =
      AddStockDto(description: "", user_id: null, category: null);

  StockController(
    this._storageRepository,
    this._userRepository,
  ) : super(const StockState.initial());

  Future<void> addNewStock() async {
    emit(state.copyWith(
      status: StockStateStatus.loading,
    ));
    try {
      addStockDto.user_id = await _userRepository.getUserid();
      await _storageRepository.createStorage(addStockDto.toMap());
      emit(state.copyWith(
        status: StockStateStatus.success,
      ));

      log(state.status.name);
    } catch (e, s) {
      log('Erro ao criar estoque', error: e, stackTrace: s);
      emit(state.copyWith(
          status: StockStateStatus.error,
          errorMessage: 'Erro ao criar estoque'));
    }
  }
}
