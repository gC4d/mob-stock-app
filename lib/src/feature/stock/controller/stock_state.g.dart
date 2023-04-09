// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension StockStateStatusMatch on StockStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == StockStateStatus.initial) {
      return initial();
    }

    if (v == StockStateStatus.loading) {
      return loading();
    }

    if (v == StockStateStatus.success) {
      return success();
    }

    if (v == StockStateStatus.error) {
      return error();
    }

    throw Exception('StockStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == StockStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == StockStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == StockStateStatus.success && success != null) {
      return success();
    }

    if (v == StockStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
