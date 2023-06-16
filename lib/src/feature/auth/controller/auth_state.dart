import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'auth_state.g.dart';

@match
enum AuthStateStatus {
  initial,
  loading,
  success,
  error,
}

class AuthState extends Equatable {
  final AuthStateStatus status;
  final String? errorMessage;
  const AuthState({
    required this.status,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [status, errorMessage];

   const AuthState.initial()
      : status = AuthStateStatus.initial,
        errorMessage = null;
  

  AuthState copyWith({
    AuthStateStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
