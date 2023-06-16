// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ValidationStateStatusMatch on ValidationStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() error,
      required T Function() sucess}) {
    final v = this;
    if (v == ValidationStateStatus.initial) {
      return initial();
    }

    if (v == ValidationStateStatus.loading) {
      return loading();
    }

    if (v == ValidationStateStatus.error) {
      return error();
    }

    if (v == ValidationStateStatus.sucess) {
      return sucess();
    }

    throw Exception(
        'ValidationStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? sucess}) {
    final v = this;
    if (v == ValidationStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == ValidationStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == ValidationStateStatus.error && error != null) {
      return error();
    }

    if (v == ValidationStateStatus.sucess && sucess != null) {
      return sucess();
    }

    return any();
  }
}
