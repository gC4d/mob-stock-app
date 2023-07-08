// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension GroupStateStatusMatch on GroupStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == GroupStateStatus.initial) {
      return initial();
    }

    if (v == GroupStateStatus.loading) {
      return loading();
    }

    if (v == GroupStateStatus.success) {
      return success();
    }

    if (v == GroupStateStatus.error) {
      return error();
    }

    throw Exception('GroupStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == GroupStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == GroupStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == GroupStateStatus.success && success != null) {
      return success();
    }

    if (v == GroupStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
