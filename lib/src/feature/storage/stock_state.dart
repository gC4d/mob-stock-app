// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:mob_storage_app/src/core/models/storage_model.dart';

import '../../core/models/products_model.dart';

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
  final int? category;
  final List<ProductsModel>? products;
  final String? errorMessage;

  const StockState({
    required this.products, 
    required this.category, 
    required this.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, category, errorMessage, products];

  const StockState.initial()
      : status = StockStateStatus.initial,
        category = null,
        products = const [],
        errorMessage = null;
  
  

  StockState copyWith({
    StockStateStatus? status,
    int? category,
    List<ProductsModel>? products,
    String? errorMessage,
  }) {
    return StockState(
      status: status ?? this.status,
      category: category ?? this.category,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
