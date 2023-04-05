// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:mob_storage_app/src/core/models/storage_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  success,
  error,
  notLogged,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final bool isLogged;
  final List<StorageModel> storages;
  final String? errorMessage;

  const HomeState({
    required this.storages, 
    required this.status,
    required this.isLogged,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, isLogged, errorMessage, storages];

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        isLogged = false,
        storages = const [],
        errorMessage = null;
  
  

  HomeState copyWith({
    HomeStateStatus? status,
    bool? isLogged,
    List<StorageModel>? storages,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      isLogged: isLogged ?? this.isLogged,
      storages: storages ?? this.storages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
