import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final bool isLogged;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.isLogged,
    this.errorMessage,
  });

  @override
  List<Object> get props => [];

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        isLogged = false,
        errorMessage = null;
  
  HomeState copyWith({
    HomeStateStatus? status,
    bool? isLogged,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      isLogged: isLogged ?? this.isLogged,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
