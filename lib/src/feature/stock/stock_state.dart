// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:mob_storage_app/src/core/data/database/database.dart';

import '../../core/models/user_model.dart';

part 'stock_state.g.dart';

@match
enum StockStateStatus {
  initial,
  loading,
  success,
  error,
}

class StockState extends Equatable {
  final StockStateStatus status;
  final List<StockData> stocks;
  final String? errorMessage;

  const StockState({
    required this.stocks,
    required this.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, errorMessage, stocks];

  const StockState.initial()
      : status = StockStateStatus.initial,
        stocks = const [],
        errorMessage = null;

  StockState copyWith({
    StockStateStatus? status,
    bool? isLogged,
    List<StockData>? stocks,
    UserModel? user,
    String? errorMessage,
  }) {
    return StockState(
      status: status ?? this.status,
      stocks: stocks ?? this.stocks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
