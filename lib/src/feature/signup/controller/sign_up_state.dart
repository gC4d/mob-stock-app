// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'sign_up_state.g.dart';

@match
enum SignUpStateStatus {
  initial,
  loading,
  success,
  error,
}


class SignUpState extends Equatable {
  final SignUpStateStatus status;
  final String? errorMessage;
  const SignUpState({
    required this.status,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [status, errorMessage];

  const SignUpState.initial()
      : status = SignUpStateStatus.initial,
        errorMessage = null;

  SignUpState copyWith({
    SignUpStateStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
