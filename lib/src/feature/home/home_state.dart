// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:mob_storage_app/src/core/models/stock_model.dart';

import '../../core/models/user_model.dart';

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
  final List<StockModel> stocks;
  final UserModel? user;
  final String? errorMessage;

  const HomeState({
    required this.stocks,
    this.user,  
    required this.status,
    required this.isLogged,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, isLogged, errorMessage, stocks];

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        isLogged = false,
        user = null,
        stocks = const [],
        errorMessage = null;
  
  

  HomeState copyWith({
    HomeStateStatus? status,
    bool? isLogged,
    List<StockModel>? stocks,
    UserModel? user,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      isLogged: isLogged ?? this.isLogged,
      stocks: stocks ?? this.stocks,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
