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
      required T Function() userLogged,
      required T Function() userNotLogged,
      required T Function() haveGroups,
      required T Function() doNotHaveGroups}) {
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

    if (v == ValidationStateStatus.userLogged) {
      return userLogged();
    }

    if (v == ValidationStateStatus.userNotLogged) {
      return userNotLogged();
    }

    if (v == ValidationStateStatus.haveGroups) {
      return haveGroups();
    }

    if (v == ValidationStateStatus.doNotHaveGroups) {
      return doNotHaveGroups();
    }

    throw Exception(
        'ValidationStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? userLogged,
      T Function()? userNotLogged,
      T Function()? haveGroups,
      T Function()? doNotHaveGroups}) {
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

    if (v == ValidationStateStatus.userLogged && userLogged != null) {
      return userLogged();
    }

    if (v == ValidationStateStatus.userNotLogged && userNotLogged != null) {
      return userNotLogged();
    }

    if (v == ValidationStateStatus.haveGroups && haveGroups != null) {
      return haveGroups();
    }

    if (v == ValidationStateStatus.doNotHaveGroups && doNotHaveGroups != null) {
      return doNotHaveGroups();
    }

    return any();
  }
}
