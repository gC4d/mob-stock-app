// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension HomeStateStatusMatch on HomeStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error,
      required T Function() notLogged}) {
    final v = this;
    if (v == HomeStateStatus.initial) {
      return initial();
    }

    if (v == HomeStateStatus.loading) {
      return loading();
    }

    if (v == HomeStateStatus.success) {
      return success();
    }

    if (v == HomeStateStatus.error) {
      return error();
    }

    if (v == HomeStateStatus.notLogged) {
      return notLogged();
    }

    throw Exception('HomeStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error,
      T Function()? notLogged}) {
    final v = this;
    if (v == HomeStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == HomeStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == HomeStateStatus.success && success != null) {
      return success();
    }

    if (v == HomeStateStatus.error && error != null) {
      return error();
    }

    if (v == HomeStateStatus.notLogged && notLogged != null) {
      return notLogged();
    }

    return any();
  }
}
