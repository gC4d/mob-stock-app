// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension SignUpStateStatusMatch on SignUpStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == SignUpStateStatus.initial) {
      return initial();
    }

    if (v == SignUpStateStatus.loading) {
      return loading();
    }

    if (v == SignUpStateStatus.success) {
      return success();
    }

    if (v == SignUpStateStatus.error) {
      return error();
    }

    throw Exception(
        'SignUpStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == SignUpStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == SignUpStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == SignUpStateStatus.success && success != null) {
      return success();
    }

    if (v == SignUpStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
