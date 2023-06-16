import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/repositories/storages/storage_repository.dart';
import 'package:mob_storage_app/src/core/services/synchronizer/synchronizer.dart';
import 'package:mob_storage_app/src/feature/home/home_state.dart';

import '../../core/data/database/database.dart';
import 'stock_state.dart';

class StockController extends Cubit<StockState> {
  final StorageRepository _storageRepository;
  final Synchronizer synchronizer;
   late StockData stockData = StockData(description: '', category: 0, amount: 0, id: 0, sync: 0);
  StockController(
    this._storageRepository,
    this.synchronizer,
  ) : super(const StockState.initial());

   Future<void> addNewStock() async {
    emit(state.copyWith(
      status: StockStateStatus.loading,
    ));
    try {
      await _storageRepository.localCreateStock(stockData);

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
  Future<void> getStocks() async {
    emit(state.copyWith(status: StockStateStatus.loading));
      try {
        if(await synchronizer.checkForServerOn() == 1){
          
          await synchronizer.SynchronizeStocks();
        }
        final stocks = await _storageRepository.localFindAllStocks();
        emit(
          state.copyWith(
            status: StockStateStatus.success,
            stocks: stocks,
          ),
        );
      } catch (e, s) {
        log('Erro ao buscar estoques', error: e, stackTrace: s);
        emit(
          state.copyWith(
              status: StockStateStatus.error,
              errorMessage: 'Erro ao buscar estoques'),
        );
      }
    }
  }

